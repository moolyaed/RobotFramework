*** Settings ***
Documentation    Asserting Bid value in Coin Switch Website
...              By fetching the Bids value and comparing it with Limit price
Resource    ../Keywords/CSKeywords.robot
Resource    ../Keywords/CSKeywords.robot

Suite Setup    Open My Browser
Suite Teardown    Close All Browsers

*** Test Cases ***
Assert Bids Value
    [Tags]     Regression
    [Setup]    Log To Console    ${TestSetup}
    Given User should be in TradeNow site
    When Gets the Bids Value
    Then Assert the Bids value with Limit price
    [Teardown]    Log To Console    ${TestTeardown}

