@echo off

cd /d "%~dp0"

if not exist "%~dp0QRes.exe" (
    echo Error: 'QRes.exe' not found. Download it here: https://www.majorgeeks.com/mg/getmirror/qres,1.html
    pause
    exit /b 1
)

set "CONFIG=%~dp0config.ini"

if not exist "%CONFIG%" (
    echo Error: 'config.ini' not found.
    pause
    exit /b 1
)

for /f "usebackq tokens=1,2 delims==" %%A in ("%CONFIG%") do (
    if "%%A"=="TARGET_EXE" set "TARGET_EXE=%%B"
    if "%%A"=="TARGET_X" set "TARGET_X=%%B"
    if "%%A"=="TARGET_Y" set "TARGET_Y=%%B"
    if "%%A"=="TARGET_R" set "TARGET_R=%%B"
)

if not defined TARGET_X (echo Error: 'TARGET_X' not set in 'config.ini' & pause & exit /b 1)
if not defined TARGET_Y (echo Error: 'TARGET_Y' not set in 'config.ini' & pause & exit /b 1)
if not defined TARGET_R (echo Error: 'TARGET_R' not set in 'config.ini' & pause & exit /b 1)
if not defined TARGET_EXE (
    echo Application process name not set in 'config.ini'.
    set /p TARGET_EXE=Enter the application/game EXE name ^(e.g. 're4.exe'^): 
) else (
    echo Application process name set in 'config.ini': %TARGET_EXE%
)

echo Capturing current resolution...

"QRes.exe" /s | findstr /r "[0-9]x[0-9]" > "%~dp0qres_out.txt"

for /f "usebackq tokens=1 delims=x" %%A in ("%~dp0qres_out.txt") do set "CUR_X=%%A"
for /f "usebackq tokens=2 delims=x," %%A in ("%~dp0qres_out.txt") do set "CUR_Y=%%A"
for /f "usebackq tokens=2 delims=@" %%A in ("%~dp0qres_out.txt") do set "CUR_R=%%A"
for /f "tokens=1" %%A in ("%CUR_R%") do set "CUR_R=%%A"

del "%~dp0qres_out.txt"

echo Current resolution: %CUR_X%x%CUR_Y% @ %CUR_R%Hz
echo Target resolution (config.ini): %TARGET_X%x%TARGET_Y% @ %TARGET_R%Hz

echo Waiting for application to start...

:waitstart
    timeout /t 2 >nul
    tasklist | findstr /i "%TARGET_EXE%" >nul
if errorlevel 1 goto waitstart

echo Application detected. Changing resolution...

"QRes.exe" /x:%TARGET_X% /y:%TARGET_Y% /r:%TARGET_R% >nul 2>&1

echo Waiting for application to close...

:waitclose
    timeout /t 5 >nul
    tasklist | findstr /i "%TARGET_EXE%" >nul
if not errorlevel 1 goto waitclose

echo Application closed. Restoring resolution...

"QRes.exe" /x:%CUR_X% /y:%CUR_Y% /r:%CUR_R% >nul 2>&1