***Settings***
Library     Browser
Library     OperatingSystem
Library     Collections
Resource    ../resource/PrinceOfTennis_keywords.resource

***Variables***
#@{day_list}   1    2    3    4    6    7    8    9   10    11    13    14    15    16    17    18    20    21    22    23    24    25   27    28    29    30    31
@{day_list}    30      31       25
${BOOKING_TIME}    8:00   #ใช้ 24hr format แต่ถ้าก่อน 10:00 ไม่ต้องใส่ 0 นำหน้า เช่น 8:00

***Test Cases***
Prince Of Tennis Court Booker
    Login To Page
    Book Court       @{day_list} 


