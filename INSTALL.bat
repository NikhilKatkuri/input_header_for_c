@echo off
cd /d "%~dp0"
title Input Library Installer
color 0b
cls

echo.
echo Input Library Installer v1.0
echo by NikhilKatkuri
echo.
echo ====================
echo.

REM Check for GCC and ar
where gcc >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: GCC compiler not found!
    echo.
    echo Please install MinGW or Dev-C++ first:
    echo https://sourceforge.net/projects/mingw/
    echo.
    pause
    exit /b 1
)
where ar >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: ar not found! Ensure binutils is installed and in PATH
    echo.
    echo Please install MinGW or Dev-C++ first:
    echo https://sourceforge.net/projects/mingw/
    echo.
    pause
    exit /b 1
)

REM Check for core files
if not exist "core\input.h" (
    echo Error: core\input.h not found                                                                                                                                                                                                                                          
    pause
    exit /b 1
)
if not exist "core\input.c" (
    echo Error: core\input.c not found
    pause
    exit /b 1
)

echo OK GCC and ar found!
echo.
echo Installing Input Library system-wide...
echo Note: This requires administrator privileges.
echo.

REM Check for Administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: This installation requires Administrator privileges
    echo Please run this installer as Administrator.
    pause
    exit /b 1
)

set "install_type=system"
goto system_install
    pause
    exit /b 1
)

:system_install

REM Get MinGW installation path
echo Please enter your MinGW installation path.
echo Common paths:
echo   C:\MinGW
echo   C:\Program Files\MinGW
echo   C:\msys64\mingw64
echo   C:\TDM-GCC-64
echo.
set /p install_path="Enter MinGW path (without trailing backslash): "

REM Validate MinGW path
if not exist "%install_path%\include" (
    echo Error: MinGW include directory not found at %install_path%\include
    echo Please check your MinGW installation path.
    pause
    exit /b 1
)
if not exist "%install_path%\lib" (
    echo Error: MinGW lib directory not found at %install_path%\lib
    echo Please check your MinGW installation path.
    pause
    exit /b 1
)
goto install

:install
REM Copy header file
copy "core\input.h" "%install_path%\include\" >nul
if %errorlevel% equ 0 (
    echo OK Header file installed to %install_path%\include\
) else (
    echo Error: Failed to copy core\input.h to %install_path%\include
    goto end
)

REM Compile static library
gcc -c "core\input.c" -o input.o
if %errorlevel% equ 0 (
    echo OK Object file compiled successfully
) else (
    echo Error: Failed to compile core\input.c
    goto end
)

REM Create static library archive
ar rcs libinput.a input.o
if %errorlevel% equ 0 (
    echo OK Static library created successfully
) else (
    echo Error: Failed to create libinput.a
    goto end
)

REM Copy library
copy "libinput.a" "%install_path%\lib\" >nul
if %errorlevel% equ 0 (
    echo OK Library installed to %install_path%\lib\
) else (
    echo Error: Failed to copy libinput.a to %install_path%\lib
    goto end
)

REM Verify installed files
if not exist "%install_path%\include\input.h" (
    echo Error: Verification failed - input.h not found in %install_path%\include
    goto end
)
if not exist "%install_path%\lib\libinput.a" (
    echo Error: Verification failed - libinput.a not found in %install_path%\lib
    goto end
)

REM Clean up temporary files
if exist input.o del input.o
if exist libinput.a del libinput.a

goto test_installation

:test_installation
echo.
echo Testing installation...
if not exist "simple_test.c" (
    echo Error: simple_test.c not found
    goto end
)
set "compile_cmd=gcc -I^"%install_path%\include^" simple_test.c -L^"%install_path%\lib^" -linput -o simple_test.exe"
%compile_cmd%
if %errorlevel% equ 0 (
    echo.
    echo OK Installation test successful!
    echo.
    setlocal enabledelayedexpansion
    set /p run_test="Run test program? (y/n): "
    if /i "!run_test!"=="y" (
        echo.
        echo Running test...
        simple_test.exe
    )
    endlocal
    echo.
    echo INSTALLATION COMPLETE!
    echo.
    echo Use in your programs:
    echo   #include ^<input.h^>
    echo Compile with:
    echo   gcc yourprogram.c -linput -o yourprogram.exe
    echo.
    echo Example program (simple_test.c):
    echo   #include ^<input.h^>
    echo   #include ^<stdio.h^>
    echo   int main() {
    echo       char str[50];
    echo       short num;
    echo       input("Enter a string: ", str, sizeof(str));
    echo       inputShort("Enter a number: ", ^&num);
    echo       printf("You entered: %%s, %%hd\n", str, num);
    echo       return 0;
    echo   }
) else (
    echo.
    echo Error: Installation test failed!
    echo The library may not be properly installed.
)
if exist simple_test.exe del simple_test.exe

:end
echo.
echo ====================
echo Thank you for using Input Library v1.0!
echo ====================
echo.
pause
exit /b 0