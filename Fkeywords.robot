*** Settings ***
Library    s
Resource    ..//Variables/FlipVariables.robot

*** Keywords ***

#Maximize window and close popup
ClosePopup
    Maximize Browser Window
    Click Element    ${ClosePopup}

#We have to select the Mens T-shirt option from Fashion list
Select Mens T-shirt
    Mouse Over    ${fashion}
    Wait Until Element Is Visible    ${menTshirt}
    Click Element    ${menTshirt}

#Select a T shirt from the list of T-shirt
Select item
    Wait Until Page Contains    ${textTshirt}
    Scroll Element Into View    ${Item}
    Click Element    ${Item}

#Item will be opened in the next tab,so change the tab
Change tab
    ${TabWindowHandles}    Get Window Handles
    Switch Window    ${TabWindowHandles}[1]
    Wait Until Element Is Visible    ${SizeChart}
    Click Element    ${SizeChart} 

#Iterate over the Size chart table content to select particular size
Size chart iteration
    ${Row_Count}    SeleniumLibrary.Get Element Count    ${WebTableRow}
    ${Column_Count}    SeleniumLibrary.Get Element Count    ${WebTableColumn} 
    Log To Console    ${Row_Count}
    Log To Console    ${Column_Count}
    FOR    ${Row_Index}    IN RANGE    1    ${Row_Count}+1  
        ${Header}=    Get Text    //table[@class='_2WObml']/tbody/tr[${Row_Index}]/td[2]
        Log To Console    ${Header}
        Run Keyword If    '${Header}' == '${Chest}'    Exit For Loop
    END 
    FOR    ${Column_Index}    IN RANGE    1    ${Column_Count}+1 
        ${Size_Text}=    Get Text    //table[@class='_2WObml']/tbody/tr[${Row_Index}]/td[${Column_Index}]
        IF    "${Size_Text}" == "${Expected_Value}"
        
            ${Actual_Text}=    Get Text    //table[@class='_2WObml']/tbody/tr[${Row_Index}]/td[1]
            Log To Console    ${Actual_Text}
            Log To Console    ${Size_Text}
        ELSE
            Log To Console    ${Size_Text}
        END
        Log    ${Column_Index}
        Run Keyword If    '${Size_Text}' == '${Expected_Value}'    Exit For Loop
    END

#Select Mediam size Shirt and Add to cart
AddingToCart
    Click Element    ${CloseSizeChart}
    Wait Until Element Is Visible    ${M}    ${time}
    Mouse Over    ${M}
    Element Should Contain    ${M_MouseOverDesription}    ${M_Text}
    ${Description}=    Get Text    ${M_MouseOverDesription}
    Log To Console    ${Description}
    Mouse Over    ${ShirtImage}
    Scroll Element Into View    ${AddToCart}
    Click Element    ${AddToCart}
