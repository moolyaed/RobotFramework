*** Settings ***

Resource    ..//Keywords/Flipkeywords.robot


Suite Setup    Open Browser    ${url}    ${browser}    
Suite Teardown    Close All Browsers

*** Test Cases ***

TC1: Search And Select Required Item
    [Tags]    Regression
    [Setup]    Log To Console    ${ts1}
    Given Close Popup
    When Select Mens T-shirt
    Then Select item
    [Teardown]    Log To Console    ${td1}

TC2: Iterate Size Chart
    [Tags]    Regression
    [Setup]    Log To Console    ${ts2}
    Given Change tab
    When Size chart iteration
    [Teardown]    Log To Console    ${td2}

TC3: Adding To Cart
    [Tags]    Sanity
    [Setup]    Log To Console    ${ts3}
    Given AddingToCart
    [Teardown]    Log To Console    ${td3}

    



    