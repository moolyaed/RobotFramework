*** Settings ***
Documentation    Google sheet Integration
Library    
Library    
Resource    ..//Variables/DataDrivenVariables.robot  
Library    RPA.Cloud.Google
Library    String

Suite Setup    open my browser
Suite Teardown    Close Browser

*** Variables ***
${Sheet_Id}    1DuqdBp0D0eZI0bInjLehK-5v2CFB8eV4Enti_uHeiwU
${Sheet_Range}    Sheet1!A2:A4


*** Tasks ***
Read values from the Google Sheet
    [Documentation]    Fetching data from Google sheets and using it for searching items in Flipkart
    [Tags]    Regression
    ${spreadsheet_content}=    Get Sheet Values
    ...    ${SHEET_ID}
    ...    ${SHEET_RANGE}
    IF    "values" in ${spreadsheet_content}
        Log To Console    ${spreadsheet_content["values"]}
    END
   
    FOR    ${d}    IN RANGE    0    3    
        ${r}=    Convert To String    ${spreadsheet_content["values"]}[${d}]
        ${u}=    Get Substring    ${r}    2    -2
        Input Text    ${Search_Box}    ${u}
        Press Keys    ${Search_Box}    ENTER
        #Clear Element Text    ${Search_Box}
        Press Keys   ${Search_Box}   CTRL+a   BACKSPACE
    END
   
    
   

    