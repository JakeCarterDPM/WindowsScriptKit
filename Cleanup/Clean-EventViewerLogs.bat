@echo off

echo.
echo -----------------------------------------------------------------
echo --------------- Jake Carter's Windows Script Kit ----------------
echo ---------------------- Event Logs Cleaner -----------------------
echo -----------------------------------------------------------------
echo.

REM ADMIN CHECK
echo Admin Check: Ensuring admin permissions...
FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
echo.
echo All Event Logs have been cleared!
goto exitprogram

:do_clear
echo clearing %1
wevtutil.exe cl %1
goto :eof

:noAdmin
echo Admin Check: Administrative permissions missing.
echo Admin Check: Please start script as admin!
pause >nul

:exitprogram
echo.
echo -----------------------------------------------------------------
echo ----------------------- Script completed! -----------------------
echo -----------------------------------------------------------------
pause
exit
