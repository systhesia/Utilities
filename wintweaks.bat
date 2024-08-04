@echo off
:: Check if the script is running with administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    :: If running as admin, launch PowerShell and execute the command
    powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://christitus.com/win | iex"
    pause
) else (
    :: If not running as admin, relaunch the batch script as admin
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
)
exit
