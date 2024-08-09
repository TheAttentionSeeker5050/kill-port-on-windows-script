@echo off
setlocal

if "%~1"=="" (
    echo Usage: killPort.cmd [port]
    exit /b 1
)

set "port=%~1"

rem Find the PID associated with the port
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :%port%') do (
    set "pid=%%a"
)

if not defined pid (
    echo No process found on port %port%.
    exit /b 1
)

rem Kill the process
taskkill /PID %pid% /F
echo Killed process on port %port% (PID: %pid%).

endlocal
