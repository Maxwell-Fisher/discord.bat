:setup
@echo off
title Discord.bat
setlocal
call :setESC
color 0F
node -v|find /i "not recognized" >nul && echo It seems that you do not have node.js installed. Press any key to continue && pause >nul
mode 100, 25
echo You must update some packages to start this application. Press any key to continue...&& pause >nul
echo Updating... [0/2]
color 0F
call updates\1.bat
color 0F
call updates\2.bat
color 0F
call updates\3.bat
color 0F
:update-complete
title Discord.bat
echo Updates complete
if not exist temp mkdir temp
::if not exist temp\send mkdir temp\send
::if not exist temp\read mkdir temp\read
if not exist temp\channel echo. > temp\channel
ping 127.0.0.1 -n 1 >nul
cls
goto load
:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0

:load
echo Loading color
set red=%ESC%[91m%ESC%[41m__%ESC%[0m
echo|set /p="%red%"
set yellow=%ESC%[93m%ESC%[43m__%ESC%[0m
echo|set /p="%yellow%"
set green=%ESC%[92m%ESC%[42m__%ESC%[0m
echo|set /p="%green%"
set blue=%ESC%[94m%ESC%[44m__%ESC%[0m
echo|set /p="%blue%"
set cyan=%ESC%[96m%ESC%[46m__%ESC%[0m
echo|set /p="%cyan%"
set magenta=%ESC%[95m%ESC%[45m__%ESC%[0m
echo|set /p="%magenta%"
set black=%ESC%[30m%ESC%[40m__%ESC%[0m
echo|set /p="%black%"
set white=%ESC%[90m%ESC%[47m__%ESC%[0m
echo|set /p="%white%"
color 0F
echo.
cls
echo Please enter your Discord token:
set /p login=: 
cls
echo { > temp\login
echo|set /p='token': '>> temp\login
echo|set /p=%login%>> temp\login
echo '>> temp\login
echo } >> temp\login
echo Please enter the ID of the channel to join:
set /p channel=: 
cls
echo %channel% > temp\channel
cls
echo Please type your message:
set /p message=: 
cls
echo %message% > temp\message
node send.js
color 0F
echo Sent!
pause