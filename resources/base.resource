*** Settings ***

Library  AppiumLibrary
Library    String

*** Keywords ***
Start Session
	Open Application		http://localhost:4723/wd/hub
	...						platformName=Android
	...						deviceName=Android Emulator
	...						automationName=UIAutomator2
	...						app=${EXECDIR}/apps/markx.apk
	...						udid=emulator-5554
	...						autoGrantPermissions=true

Get Started
  Wait Until Page Contains		${START}
  Click Text      ${START}

Navigate to ${item_text}
    Wait Until Element Is Visible       ${HAMBURGUER_MENU}
    Click Element       ${HAMBURGUER_MENU}
    Wait Until Element Is Visible       ${HAMBURGER_NAV_TITLE}

	${element}=    Replace String    ${MENU_ITEM}    $$    ${item_text}
    Wait Until Element Is Visible       ${element}
    Click Element   ${element}

Go to item 
    [Arguments]    ${item}    ${checkpoint}
    Wait Until Page Contains       ${item}
    Click Text    ${item}
    Wait Until Page Contains     ${checkpoint}    10s

Close session
	Close Application

Get Element positions
  [Arguments]    ${locator}

	${positions}=    Get Element Location    ${locator}

  [Return]    ${positions}
  
Back Last Screen

  Wait Until Element Is Visible    ${BACK_PAGE}
  Click Element   ${BACK_PAGE}
