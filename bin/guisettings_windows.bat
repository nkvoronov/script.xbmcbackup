rem BATCH FILE TO CLOSE XBMC, COPY GUISETTINGS, AND RELAUNCH

Setlocal EnableDelayedExpansion
set XBMC_PROFILE=%1
set XBMC_PATH=%2
set quote="

if "!XBMC_PROFILE:~-1!" NEQ "!quote!" (SET XBMC_PROFILE="!XBMC_PROFILE!")
if "!XBMC_PATH:~-1!" NEQ "!quote!" (SET XBMC_PATH="!XBMC_PATH!")

rem get rid of any slashes in xbmc path
if "%XBMC_PATH:~-2% == "\" ( goto loop ) else ( goto loop2)

:loop

set XBMC_PATH=%XBMC_PATH:~0,-2%"
echo %XBMC_PATH%

if "%XBMC_PATH:~-2% == "\" ( goto loop ) else ( goto loop2 )

rem get rid of any slashes in the profile path
:loop2
if "%XBMC_PROFILE:~-2% == "\" (set XBMC_PROFILE=%XBMC_PROFILE:~0,-2%") else ( goto killProgram )
echo %XBMC_PROFILE%

if "%XBMC_PROFILE:~-2% == "\" ( goto loop2 ) else ( goto killProgram )

:killProgram
taskkill /f /im XBMC.exe

copy %XBMC_PROFILE%\userdata\guisettings.xml.restored %XBMC_PROFILE%\userdata\guisettings.xml

ping 127.0.0.1 

start "" %XBMC_PATH%\XBMC.exe
