                        ::Ray Ping::
REG IMPORT normalstyle.reg>nul
Bash
mode con:cols=27 lines=30>nul
@echo off 
chcp 65001>nul
title Ray Ping 
setlocal enabledelayedexpansion
chcp 1252>nul

:info

@echo.
nhcolor 0c ...........................
nhcolor 0e "    " Alexandr BelikOff
nhcolor 08 "       "BelikOff#3905
nhcolor 06 "         " Ray Ping
nhcolor 08 "          "-=3.7=-
@echo.
nhcolor 0c ...........................
@echo. 

goto :Ping

:ping
for /f "usebackq tokens=1,2 delims=: " %%i in ("pinglist.txt") do (
(
for /f "tokens=5 delims==ms" %%k in ('ping -n 1 %%j^|  findstr /i "time="') do (
set time_%%i=%%k
set time_%%i=!time_%%i!

 IF %%k LEQ 100 ( call :ECHO %%i 0f  &&  nhcolor 0a  " "=" "!time_%%i!  ms ) ELSE ( IF %%k LEQ 200 ( call :ECHO %%i 0f &  nhcolor 0e  " "=" "!time_%%i! ms ) ELSE ( call :ECHO %%i 0f &  nhcolor 0c " "=" "!time_%%i! ms ) )
)
)||( 
nhcolor cf %%i
) 
) 








@echo.
nhcolor 0c ...........................
call :ECHO "   "Presss 0f  &  call :ECHO " "[1]" " 0c  & nhcolor 0f to settings
choice /c 1N /t 3 /d n >nul
if %ERRORLEVEL%==1 (start pinglist.txt && cls && goto :info)
if %ERRORLEVEL%==2 (cls && goto :info)





:ECHO
for /f %%i in ('"prompt $h& for %%i in (.) do rem"') do (set Z=%%i)
pushd "%TEMP%" && (
    <nul>"%~1^" set /p="%Z%%Z%  %Z%%Z%"
    findstr /a:%2 . "%~1^*"
    del "%~1^"
    popd
    )
exit /b

endlocal
pause>nul