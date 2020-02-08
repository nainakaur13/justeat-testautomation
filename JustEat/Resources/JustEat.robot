*** Settings ***
Documentation    This covers keywords for JustEat Suite
Resource  ../Resources/PO/LandingPage.robot
Resource  ../Resources/PO/SearchPage.robot


*** Variables ***



*** Keywords ***
Search for restaurants by area
    [Documentation]  This keyword finds restaurants in specifc area(using postcode)
    ...   Postcode is passed as an argument
    [Arguments]  ${postcode}
    LandingPage.Enter search address  ${postcode}
    LandingPage.Submit search
    SearchPage.Verify search result  ${postcode}

Search for restaurants by cuisine
    [Documentation]  This keyword finds restaurants by cuisine in specifc area
    ...   Cuisine is passed as an argument
    [Arguments]  ${cuisine}
    SearchPage.Select cuisine from popular cuisine tile  ${cuisine}
    SearchPage.Verify cuisine search result  ${cuisine}


Search for restaurants by special offers
    [Documentation]  This keyword finds restaurants by special offers in specifc area
    SearchPage.Select special offer filter
    SearchPage.Verify special offer search result