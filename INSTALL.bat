@echo off
title Build and Install input Library
color 0b

echo =====================================
echo   Building libinput.a for MinGW
echo =====================================

:: Ask user for MinGW path
set /p MINGWROOT=Enter your MinGW root folder (e.g. C:\MinGW): 

:: Check if folder exists
if not exist "%MINGWROOT%" (
    echo ERROR: Path "%MINGWROOT%" not found!
    pause
    exit /b
)

cd /d "%~dp0core"

:: Step 1: Compile input.c to object file
echo Compiling input.c ...
gcc -c input.c -I. -o input.o
if errorlevel 1 (
    echo  Compilation failed!
    pause
    exit /b
)

:: Step 2: Create static library
echo Creating libinput.a ...
ar rcs libinput.a input.o
if errorlevel 1 (
    echo Library creation failed!
    pause
    exit /b
)

:: Step 3: Copy header to MinGW include
echo Copying input.h to %MINGWROOT%\include ...
copy /Y input.h "%MINGWROOT%\include\"
if errorlevel 1 (
    echo Failed to copy input.h!
    pause
    exit /b
)

:: Step 4: Copy libinput.a to MinGW lib
echo Copying libinput.a to %MINGWROOT%\lib ...
copy /Y libinput.a "%MINGWROOT%\lib\"
if errorlevel 1 (
    echo Failed to copy libinput.a!
    pause
    exit /b
)

echo =====================================
echo Library installed successfully!
echo You can now use: #include ^<input.h^>
echo and compile with: gcc main.c -linput
echo =====================================

pause
