*** Settings ***
#Library    RequestsLibrary
#Library    SeleniumLibrary
Library    SeleniumLibrary
Library    RequestsLibrary
Resource    ..//Variables/CSVariable.robot

*** Keywords ***
Open My Browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

User should be in TradeNow site
    Click Button    ${TradeNow}
    Wait Until Element Is Visible    ${Skip_All}
    Click Element    ${Skip_All}
    Click Element    ${Done}

Gets the Bids Value
    Click Element    ${Bid_Value}
    ${value}    Get Value    ${LimitPrice}

Assert the Bids value with Limit price
    create session    mysession    ${Base_url}
    ${Response}=    get request    mysession    ${Parameter}
    Log To Console    ${Response.content}
    ${body}=    Convert To String    ${Response.content}
    Should Contain    ${body}    ${value}