***Settings***
Library     Browser
Library     OperatingSystem
Library     Collections
Resource    PrinceOfTennis_variables.resource


*** Keywords ***
Book Court
    [Arguments]    @{day_list}
    Log To Console    🎾 Booking court for days: ${day_list}

    FOR    ${day}    IN    @{day_list}
        ${day_str}=    Evaluate    str(int(${day}))
        Log To Console    📆 Trying day: ${day_str}

        # Step 1: Select Booking Type
        Browser.Click    ${TENNIS_RADIO_BUTTON}
        Browser.Click    ${DAYTIME_BOOKING_RADIOBTN}
        Sleep   3s  # Wait for UI to update

        # Step 2: Click calendar day if visible
        ${date_xpath}=    Set Variable    //button[not(@disabled) and not(contains(@class,"v-btn--disabled")) and .//div[normalize-space(text())="${day_str}"]]
        ${date_states}=   Browser.Get Element States    ${date_xpath}
        Log To Console    ✅ States for ${day_str}: ${date_states}
        IF    "visible" in ${date_states}
            Browser.Click    ${date_xpath}
        ELSE
            Log To Console    ⏭ Day ${day_str} is not clickable, skipping
            CONTINUE
        END

        # Step 3: Try to click time slot
        ${slot_available}=    Click Time Slot If Available    ${BOOKING_TIME}
        IF    not ${slot_available}
            Log To Console    ⛔ Booking skipped for ${day_str} — no slot available
            CONTINUE
        END

        # ✅ Step 4: Fill in phone number before checking BOOK button
        Browser.Fill Text    css=input[type="tel"]    0923894965

        # Optional: Accept cookie if still visible
        Run Keyword And Ignore Error    Browser.Click    text=ยอมรับ / ACCEPT

        # Step 5: Click booking button only if it's visible
        ${btn_states}=    Browser.Get Element States    ${BOOKING_BUTTON2}
        IF    "visible" in ${btn_states}
            Browser.Click    ${BOOKING_BUTTON2}
        ELSE
            Log To Console    ⛔ Booking skipped for ${day_str} — no slot available
        END

        # Step 6: Wait for booking confirmation
        Browser.Wait For Elements State    ${BOOKING_CONFIRMATION}    visible    timeout=20s
        Browser.Click    ${BOOKING_CONFIRMATION}
        Browser.Wait For Elements State    xpath=//span[normalize-space(text())="Waiting for confirmation"]    visible    timeout=10s
        Log To Console    🎉 Booking confirmed for ${day_str} at ${BOOKING_TIME}

        # Step 7: Back to select booking type page
        Browser.Wait For Elements State    ${BOOKING_BACK_BUTTON}    visible    timeout=20s
        Browser.Click    ${BOOKING_BACK_BUTTON}
    END
    

Click Time Slot If Available
    [Arguments]    ${time_str}

    ${slot_xpath}=    Set Variable    //span[normalize-space(text())="${time_str}"]/ancestor::span[contains(@class,"time-slot-chip") and contains(@class,"v-chip--clickable") and not(contains(@class,"v-chip--disabled"))]
    Log To Console    🕒 Waiting for visible time slot: ${time_str}

    ${found}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${slot_xpath}    visible    timeout=7s
    IF    not ${found}
        Log To Console    ❌ Time slot ${time_str} not found or not visible
        RETURN    False
    END
    Browser.Click    ${slot_xpath}
    RETURN    True
Login To Page
    [Documentation]    Opens the Prince of Tennis login page.
    Browser.New Browser     chromium           headless=False           args=["--force-device-scale-factor=1"]
    Browser.New Context
    Browser.New Page                    ${URL}
    Browser.Set Viewport Size           1920        1080

    Browser.Wait For Elements State    ${USERNAME_INPUT_FIELD}    visible       20s
    Browser.Fill Text                  ${USERNAME_INPUT_FIELD}    ${USERNAME}
    Browser.Wait For Elements State    ${PASSWORD_INPUT_FIELD}    visible       20s
    Browser.Fill Text                  ${PASSWORD_INPUT_FIELD}    ${PASSWORD}
    Browser.Wait For Elements State    ${LOGIN_BUTTON}    visible       20s
    Browser.Click                      ${LOGIN_BUTTON}
    Browser.Wait For Elements State    ${LOGIN_CONFIRM_BUTTON}    visible       20s
    Browser.Wait For Elements State    ${LOGIN_CONFIRM_BUTTON}    enabled       20s
    Browser.Click                      ${LOGIN_CONFIRM_BUTTON}
    Browser.Wait For Elements State    ${BOOKING_MENU}    visible       20s
    Browser.Click                      ${BOOKING_MENU}

