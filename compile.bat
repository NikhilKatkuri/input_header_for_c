@echo off
REM Simple compilation script using input library
REM Usage: compile.bat myprogram.c

if "%1"=="" (
    echo Usage: compile.bat ^<source_file.c^>
    echo Example: compile.bat simple_test.c
    pause
    exit /b 1
)

set SOURCE_FILE=%1
set OUTPUT_FILE=%~n1.exe

echo Compiling %SOURCE_FILE% with input library...

REM Try installed library first, then local core files
gcc -I"%USERPROFILE%\include" "%SOURCE_FILE%" -L"%USERPROFILE%\lib" -linput -o "%OUTPUT_FILE%" 2>nul

if %errorlevel% neq 0 (
    echo Library not installed, using local core files...
    gcc -Icore "%SOURCE_FILE%" core\input.c -o "%OUTPUT_FILE%"
)

if %errorlevel% equ 0 (
    echo ✓ Compilation successful: %OUTPUT_FILE%
    echo.
    echo Run with: %OUTPUT_FILE%
) else (
    echo ✗ Compilation failed!
    echo Make sure GCC is installed and input library is available.
)

pause
