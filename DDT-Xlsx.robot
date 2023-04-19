*** Settings ***
Documentation    Fetching data from Excel sheet
Library    SeleniumLibrary
Resource    ..//Variables/DataDrivenVariables.robot  
Library    DataDriver    ..//Testdata/Data.xlsx


Suite Setup    open my browser
Suite Teardown    Close Browser
Test Template    SearchFlip

*** Test Cases ***
Searching
    [Documentation]    This test case fetches values from Excel sheet and uses it has Search text

    
*** Keywords ***
SearchFlip
    [Arguments]    ${text}
    Input Text    ${Search_Box}    ${text}
    Press Keys    ${Search_Box}    ENTER
    Press Keys   ${Search_Box}   CTRL+a   BACKSPACE




    