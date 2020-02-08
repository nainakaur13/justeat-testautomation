*** Settings ***
Documentation    Every controls in this page need to have its own keyword with the required arguments being passed in.
                ...   These keywords are then used in Justeat.robot to perform the actions in Search page
Library  SeleniumLibrary

*** Variables ***
${open_restuarnt_xpath}            //span[@data-search-count="openrestaurants"]
${pizza_popularcuisine_xpath}      //input[@id="pizza-desktop-tile"]//parent::span
${pizza_checkbox_popularcuisine}   //input[@id="pizza-desktop-tile"]
${special_offer_filter_xpath}      //input[@id="with_discounts"]//parent::span
${special_offer_checkbox}            //input[@id="with_discounts"]
${special_offer}                    //div[@data-test-id="searchresults"]//p[@data-test-id="restaurant_promo_text"]
${postcode_header}                   //div[@class="c-locationHeader-container"]//h1[@class="c-locationHeader-title"]

*** Keywords ***
Verify search result
    [Documentation]   This keyword verifies search result page is loaded correctly
    [Arguments]  ${postcode}
     ${status}  ${message}  run keyword and ignore error  wait until keyword succeeds  ${MAX_TIMEOUT}  ${RETRY_INTERBAL}  page should contain element  ${open_restuarnt_xpath}
     ${status}  ${message}  run keyword and ignore error  wait until keyword succeeds  ${MAX_TIMEOUT}  ${RETRY_INTERBAL}  element should contain  ${postcode_header}  ${postcode}
     run keyword if  '${status}'=='FAIL'  run keyword
              ...     FAIL  Unable to find restaurannts


Select cuisine from popular cuisine tile
        [Documentation]  This keyword clicks on cuisine in Poular Cuisine Tile
        [Arguments]  ${cuisine}
        Click on cuisine  ${cuisine}
        Verify cuisine should be checked in popular cuisine tile  ${cuisine}


Verify cuisine search result
      [Documentation]  This keyword verifies the serach result by cuisine
      [Arguments]  ${cuisine}
      ${status}  ${message} =  Run Keyword And Ignore Error  Wait Until Keyword Succeeds  ${MAX_TIMEOUT}  ${RETRY_INTERBAL}  page should contain element  //div[@data-test-id="searchresults"]//p[contains(@data-cuisine-names, "${cuisine}")]
      Run keyword if  '${status}'=='FAIL'   run keyword
                   	...   FAIL  Not able to find restaurants by cuisine

Click on cuisine
    [Documentation]  This keyword clicks on cusine in Popular cuisine Tile
    [Arguments]  ${cuisine}
       ${status}  ${message} =  Run Keyword And Ignore Error   Wait Until Keyword Succeeds  ${MAX_TIMEOUT}  ${RETRY_INTERBAL}  click element  ${${cuisine}_popularcuisine_xpath}
       Run keyword if  '${status}'=='FAIL'   run keyword
             	...   FAIL  Unable To select ${cuisine} from Popular Cuisine Tiles


Verify cuisine should be checked in popular cuisine tile
     [Documentation]  This keyword verifies that after selecting, cusisine should be checked
     [Arguments]  ${cuisine}
      ${status}  ${message} =  Run Keyword And Ignore Error   Wait Until Keyword Succeeds  ${MAX_TIMEOUT}  ${RETRY_INTERBAL}  checkbox should be selected  ${${cuisine}_checkbox_popularcuisine}
      Run keyword if  '${status}'=='FAIL'   run keyword
      ...   FAIL  ${cuisine} is not selected/checked


Select special offer filter
    [Documentation]  This keyword clicks on special offer in filters
    Click on special offer
    Verify special offer should be checked in filter


Click on special offer
    [Documentation]  This keyword clicks on special offer in filters
       ${status}  ${message} =  Run Keyword And Ignore Error   Wait Until Keyword Succeeds  ${MAX_TIMEOUT}  ${RETRY_INTERBAL}  click element  ${special_offer_filter_xpath}
       Run keyword if  '${status}'=='FAIL'   run keyword
             	...   FAIL  Unable To select special offer filter

Verify special offer should be checked in filter
    [Documentation]  This keyword verifies special offer should be checked in filters
      ${status}  ${message} =  Run Keyword And Ignore Error   Wait Until Keyword Succeeds  ${MAX_TIMEOUT}  ${RETRY_INTERBAL}  checkbox should be selected  ${special_offer_checkbox}
      Run keyword if  '${status}'=='FAIL'   run keyword
      ...   FAIL  Special offer filter is not selected/checked

Verify special offer search result
      [Documentation]  This keyword verifies the serach result by special offer
      ${status}  ${message} =  Run Keyword And Ignore Error  Wait Until Keyword Succeeds  ${MAX_TIMEOUT}  ${RETRY_INTERBAL}  page should contain element  ${special_offer}
      Run keyword if  '${status}'=='FAIL'   run keyword
                   	...   FAIL  Not able to find restaurants by special offer