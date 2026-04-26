@echo off

echo.
echo -----------------------------------------------------------------
echo --------------- Jake Carter's Windows Script Kit ----------------
echo ---------------------- Integrity Verifier -----------------------
echo -----------------------------------------------------------------
echo.

REM ADMIN CHECK
echo Admin Check: Ensuring admin permissions...
net session >nul 2>&1
if %errorLevel% == 0 (
echo Admin Check: Administrative permissions confirmed.
echo.
goto :startup
) else (
echo Admin Check: Administrative permissions missing.
echo Admin Check: Please start script as admin!
goto :exitprogram
)
pause >nul

REM ASK FOR SCAN
:startup
set /P answer=Would you like to scan? "Y" or "N": 
if /I "%answer%" EQU "Y" goto :sfcscannow
if /I "%answer%" EQU "N" goto :exitprogram
cls
goto :startup

REM RUN SCAN
:sfcscannow
sfc /scannow
goto :checkforwindowsimagerepair

REM ASK FOR REPAIR
:checkforwindowsimagerepair
set /P answer=Was an error found? "Y" or "N": 
if /I "%answer%" EQU "Y" goto :windowsimagerepair
if /I "%answer%" EQU "N" goto :exitprogram
goto :checkforwindowsimagerepair

REM RUN REPAIR
:windowsimagerepair
DISM.exe /Online /Cleanup-image /Restorehealth
echo NOTE: 
echo It's highly suggested to restart and scan again to ensure repair was successful.
set /P answer=Would you like to restart? "Y" or "N": 
if /I "%answer%" EQU "Y" goto :restartcomputer
if /I "%answer%" EQU "N" goto :exitprogram
goto :checkforwindowsimagerepair

REM RESTART AFTER REPAIR
:restartcomputer
echo Now restarting...
shutdown.exe /r /t 00
exit

REM EXIT
:exitprogram
echo.
echo -----------------------------------------------------------------
echo ----------------------- Script completed! -----------------------
echo -----------------------------------------------------------------
pause
exit

