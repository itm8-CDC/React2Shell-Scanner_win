@echo off
setlocal

REM Get the directory where the batch file is located
set "BATDIR=%~dp0"

REM Determine bitness
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    set "BITNESS=64"
) ELSE (
    IF "%PROCESSOR_ARCHITEW6432%"=="AMD64" (
        set "BITNESS=64"
    ) ELSE (
        set "BITNESS=32"
    )
)

echo Detected bitness: %BITNESS%-bit

REM Set script name based on bitness
IF "%BITNESS%"=="64" (
    set "PS_SCRIPT=run_64bit.ps1"
) ELSE (
    set "PS_SCRIPT=run_32bit.ps1"
)

REM Run the correct Powershell.exe and script
"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy Unrestricted -NoProfile -File "%BATDIR%%PS_SCRIPT%"

endlocal