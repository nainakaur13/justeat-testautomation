*** Settings ***
Documentation   This file is host all the keywords that can be used by multiple keywords across the project.
Library  SeleniumLibrary

*** Variables ***
${Browser}                      chrome
${URL}                          http://www.just-eat.co.uk
${homepage_search_box}          //div[@data-test-id="searchBoxContainer"]
${footer-locations-cuisines}    //ul[@id="footer-locations" or @id="footer-top-cuisines"]

*** Keywords ***
Common Suite Setup
    [Documentation]  All test suites should use this in suite Setup.
    set global variable  ${MAX_TIMEOUT}  30s
    set global variable  ${RETRY_INTERBAL}  2s

Common Test Setup
    [Documentation]  All test cases should use this in Test Setup.
    Open Browser  ${URL}  ${Browser}
    Maximize browser window
    Verify home page loaded correctly
    # Possible Web User Login if Required in Test Setup based on TC condition

Common Test Teardown
    [Documentation]  All test cases should use this in Test Teardown.
    close browser
    # Possible Logout if the Website required Logout before Teardown of Each TC

Verify home page loaded correctly
     ${status}  ${message}  run keyword and ignore error  wait until keyword succeeds   ${MAX_TIMEOUT}  ${RETRY_INTERBAL}  page should contain element  ${homepage_search_box}
     ${status}  ${message}  run keyword and ignore error  wait until keyword succeeds   ${MAX_TIMEOUT}  ${RETRY_INTERBAL}  page should contain  Find restaurants delivering right now, near you
     ${status}  ${message}  run keyword and ignore error  wait until keyword succeeds   ${MAX_TIMEOUT}  ${RETRY_INTERBAL}  page should contain element  ${footer-locations-cuisines}
      run keyword if  '${status}'=='FAIL'  run keyword
         ...     FAIL  Home Page Failed to load