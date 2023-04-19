*** Settings ***
Library    SeleniumLibrary
Library    RPA.Cloud.Google

*** Variables ***
${url}    https://www.flipkart.com/
${browser}    chrome

#Closing Popup
${Popup}    //button[@class='_2KpZ6l _2doB4z']
${Search_Box}    //input[@placeholder='Search for products, brands and more']

*** Keywords ***
open my browser
    Open Browser    ${url}    ${browser}
    Set Selenium Speed    1
    Maximize Browser Window
    Click Button    ${Popup}
    Init Sheets    Service_account.json
