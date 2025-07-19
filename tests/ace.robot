***Settings***
Library     Browser
Library     OperatingSystem
Library     Collections
Resource    ../resource/PrinceOfTennis_keywords.resource

***Variables***
@{day_list}       2     3     9     10      11      12      13      14      15     16      17      23      24      30      31
#2@{day_list}    6     20      27
${BOOKING_TIME}    17:00   #ใช้ 24hr format แต่ถ้าก่อน 10:00 ไม่ต้องใส่ 0 นำหน้า เช่น 8:00
#2${BOOKING_TIME}    20:00 

***Test Cases***
Prince Of Tennis Court Booker
    Login To Page
    Book Court       @{day_list} 


