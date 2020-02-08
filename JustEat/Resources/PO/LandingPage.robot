*** Settings ***
Documentation    Every controls in this page need to have its own keyword with the required arguments being passed in.
                ...   These keywords are then used in Justeat.robot to perform the actions in landing site page
Library  SeleniumLibrary

*** Variables ***
${search_address_input}   xpath://input[@data-test-id="address-box-input"]
${search_button}          xpath://button[@data-test-id="find-restaurants-button"]


*** Keywords ***
Enter search address
    [Documentation]  Enter postcode in search box.
    [Arguments]  ${postcode}
    ${status}  ${message} =  Run Keyword And Ignore Error   Wait Until Keyword Succeeds  ${MAX_TIMEOUT}  ${RETRY_INTERBAL}  SeleniumLibrary.Input Text  ${search_address_input}  ${postcode}
    Run keyword if  '${status}'=='FAIL'   run keyword
    ...   FAIL  Unable to enter postcode in search box


Submit search
    [Documentation]  Click the search button.
    ${status}  ${message} =  Run Keyword And Ignore Error   Wait Until Keyword Succeeds  ${MAX_TIMEOUT}  ${RETRY_INTERBAL}  SeleniumLibrary.Click Element  ${search_button}
    Run keyword if  '${status}'=='FAIL'   run keyword
	...   AND  FAIL  Unable To click search button


