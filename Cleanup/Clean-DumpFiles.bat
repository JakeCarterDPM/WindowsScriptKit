@echo off
echo.
echo -----------------------------------------------------------------
echo --------------- Jake Carter's Windows Script Kit ----------------
echo ---------------------- Dump Files Cleaner -----------------------
echo -----------------------------------------------------------------
echo.

REM DELETE DUMP FILES
echo Cleaning user crash dumps...
if exist "%LOCALAPPDATA%\CrashDumps" (
    del /f /s /q "%LOCALAPPDATA%\CrashDumps\*.dmp" >nul 2>&1
)

echo Cleaning system profile crash dumps...
if exist "C:\Windows\SysWOW64\config\systemprofile\AppData\Local\CrashDumps" (
    del /f /s /q "C:\Windows\SysWOW64\config\systemprofile\AppData\Local\CrashDumps\*.dmp" >nul 2>&1
)

echo Cleaning live kernel reports...
if exist "C:\Windows\LiveKernelReports" (
    del /f /s /q "C:\Windows\LiveKernelReports\*.dmp" >nul 2>&1
)


REM REMOVE EMPTY FOLDERS
for /d %%i in ("%LOCALAPPDATA%\CrashDumps\*") do rd /s /q "%%i" >nul 2>&1

echo.
echo -----------------------------------------------------------------
echo ----------------------- Script completed! -----------------------
echo -----------------------------------------------------------------
pause
exit

