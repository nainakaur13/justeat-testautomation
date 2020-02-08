*** Settings ***
Documentation  This suite covers tests to find restaurant with different criterias(area,cusine, special offers) in Justeat site
Resource   ../Resources/Common.robot
Resource   ../Resources/JustEat.robot

Suite Setup     Common Suite Setup
#Possible  Suite Tear Down if Required Since Scenario Don't need it is omitted
Test Setup     Common Test Setup
Test Teardown  Common Test Teardown

*** Variables ***
${postcode}  AR51 1AA

*** Test Cases ***
Search for restaurants in an area
    [Documentation]     This testcase verifies user is able to find restaurant in an area using postcode
    [Tags]    Justeat
    JustEat.Search for restaurants by area  ${postcode}


Search restaurants by cuisine in an area
    [Documentation]     This testcase verifies user is able to find restaurant by cuisine (Pizza, chinese) in an area
    [Tags]    Justeat
    set test variable  ${cuisine}  pizza
    JustEat.Search for restaurants by area  ${postcode}
    JustEat.Search for restaurants by cuisine  ${cuisine}


Search restaurants by special offers in an area
    [Documentation]     This testcase verifies user is able to find restaurant by special offers in an area
    [Tags]    Justeat
    JustEat.Search for restaurants by area  ${postcode}
    JustEat.Search for restaurants by special offers











