@echo off
for /f "delims=" %%a in ('powershell -command "Get-executionpolicy -scope currentuser"') do set oldpolicy=%%a
powershell -command "set-executionpolicy -scope currentuser unrestricted"
powershell .\pikarchiver.ps1 %oldpolicy% 2> error.log
pause