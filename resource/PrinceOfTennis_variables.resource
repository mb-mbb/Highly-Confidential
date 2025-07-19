***Variables***
# Variables for the Prince of Tennis test suite
${URL}    https://access.line.me/oauth2/v2.1/login?returnUri=%2Foauth2%2Fv2.1%2Fauthorize%2Fconsent%3Fapp_id%3D1656686073-5LNA3Lo8%26client_id%3D1656686073%26scope%3Dopenid%2520profile%26state%3DxTzIiNPAoTV4%26response_type%3Dcode%26code_challenge_method%3DS256%26code_challenge%3DgC1rk2MU4gxXvkttCGUPHmfrA8rTYBdBzo-3LHJQrG0%26liff_sdk_version%3D2.21.4%26type%3DL%26redirect_uri%3Dhttps%253A%252F%252Fclient.loga.app%252Fcard%252F4486%253FliffId%253D1656686073-5LNA3Lo8%26bot_prompt%3Daggressive&loginChannelId=1656686073&loginState=KLewczeNsuxLQvlAeeEnJu#/
${USERNAME}    bomyszo1@gmail.com
${PASSWORD}    nogirl123
${DAYTIME_BOOKING_START}    7:00
${DAYTIME_BOOKING_END}      17:05

#LINE LOGIN PAGE
${USERNAME_INPUT_FIELD}          //*[@id="app"]/div/div/div/div[2]/div/form/fieldset/div[1]/input
${PASSWORD_INPUT_FIELD}          //*[@id="app"]/div/div/div/div[2]/div/form/fieldset/div[2]/input
${LOGIN_BUTTON}                  //*[@id="app"]/div/div/div/div[2]/div/form/fieldset/div[3]/button
${LOGIN_CONFIRM_BUTTON}          //*[@id="app"]/div/div/div/div/div/div[2]/div/div[3]/button

#SIANGPURE PAGE
${BOOKING_MENU}                  //*[@id="app"]/div/div[1]/div[1]/div[2]/div[2]/div[1]/div/div[1]/div/div/div

#BOOKING PAGE
${TENNIS_RADIO_BUTTON}           //*[@id="card-branch"]/div/div/div/div[2]/div/div/div/div[2]/div/div/div
${BOOKING_BUTTON}                //*[@id="app"]/div/div[1]/div[2]/form/div[3]
${DAYTIME_BOOKING_RADIOBTN}      //*[@id="card-activity"]/div/div/div/div[2]/div/div/div/div/div[1]/div/div/div
${NIGHTTIME_BOOKING_RADIOBTN}    //*[@id="card-activity"]/div/div/div/div[2]/div/div/div/div/div[2]/div/div/div
${BOOKING_CALENDAR}              //*[@id="card-dates"]/div
${BOOKING_BUTTON2}               //*[@id="app"]/div/div[1]/div[2]/form/div[5]/button
${BOOKING_CONFIRMATION}          //*[@id="app"]/div/div[1]/div[2]/div/button
${BOOKING_BACK_BUTTON}           //*[@id="app"]/div/div[1]/div[1]/div[1]/button


