*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
web
    Open Browser    https://www.tutorialspoint.com/    chrome
    Capture Page Screenshot    page.png
    Close Browser
