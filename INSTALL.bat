@echo off
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
echo Choose installation type:
echo.
echo 1. Install for current user (RECOMMENDED)
echo 2. Install system-wide (requires admin)
echo 3. Test without installing
echo 4. Exit
echo.
set /p choice="Enter choice (1-4): "

REM Validate choice
if "%choice%"=="1" (
    goto user_install
) else if "%choice%"=="2" (
    goto system_install
) else if "%choice%"=="3" (
    goto test_only
) else if "%choice%"=="4" (
    echo.
    echo Installation cancelled.
    pause
    exit /b 0
) else (
    echo.
    echo Error: Invalid choice! Please enter 1, 2, 3, or 4.
    pause
    exit /b 1
)

:user_install
echo.
echo Installing Input Library for current user...
echo.

REM Create user include and lib directories
if not exist "%USERPROFILE%\include" mkdir "%USERPROFILE%\include"
if %errorlevel% neq 0 (
    echo Error: Failed to create %USERPROFILE%\include
    goto end
)
if not exist "%USERPROFILE%\lib" mkdir "%USERPROFILE%\lib"
if %errorlevel% neq 0 (
    echo Error: Failed to create %USERPROFILE%\lib
    goto end
)

REM Copy header file
copy "core\input.h" "%USERPROFILE%\include\" >nul
if %errorlevel% equ 0 (
    echo OK Header file installed to %USERPROFILE%\include\
) else (
    echo Error: Failed to copy core\input.h to %USERPROFILE%\include
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
copy "libinput.a" "%USERPROFILE%\lib\" >nul
if %errorlevel% equ 0 (
    echo OK Library installed to %USERPROFILE%\lib\
) else (
    echo Error: Failed to copy libinput.a to %USERPROFILE%\lib
    goto end
)

REM Verify installed files
if not exist "%USERPROFILE%\include\input.h" (
    echo Error: Verification failed - input.h not found in %USERPROFILE%\include
    goto end
)
if not exist "%USERPROFILE%\lib\libinput.a" (
    echo Error: Verification failed - libinput.a not found in %USERPROFILE%\lib
    goto end
)

REM Clean up temporary files
if exist input.o del input.o
if exist libinput.a del libinput.a

goto test_installation

:system_install
echo.
echo Installing Input Library system-wide...
echo Note: This requires administrator privileges.
echo.

REM Check for Administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: This option requires Administrator privileges
    pause
    exit /b 1
)

REM Check MinGW directories
if not exist "C:\MinGW\include" (
    echo Error: MinGW include directory not found at C:\MinGW\include
    pause
    exit /b 1
)
if not exist "C:\MinGW\lib" (
    echo Error: MinGW lib directory not found at C:\MinGW\lib
    pause
    exit /b 1
)

REM Copy header file
copy "core\input.h" "C:\MinGW\include\" >nul
if %errorlevel% equ 0 (
    echo OK Header file installed to C:\MinGW\include\
) else (
    echo Error: Failed to copy core\input.h to C:\MinGW\include
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
copy "libinput.a" "C:\MinGW\lib\" >nul
if %errorlevel% equ 0 (
    echo OK Library installed to C:\MinGW\lib\
) else (
    echo Error: Failed to copy libinput.a to C:\MinGW\lib
    goto end
)

REM Verify installed files
if not exist "C:\MinGW\include\input.h" (
    echo Error: Verification failed - input.h not found in C:\MinGW\include
    goto end
)
if not exist "C:\MinGW\lib\libinput.a" (
    echo Error: Verification failed - libinput.a not found in C:\MinGW\lib
    goto end
)

REM Clean up temporary files
if exist input.o del input.o
if exist libinput.a del libinput.a

goto test_installation

:test_only
echo.
echo Testing library without installation...
echo Compiling test program with local files...
echo.
if not exist "simple_test.c" (
    echo Error: simple_test.c not found
    goto end
)
gcc -c "core\input.c" -o input.o
if %errorlevel% neq 0 (
    echo Error: Failed to compile core\input.c
    goto end
)
ar rcs libinput.a input.o
if %errorlevel% neq 0 (
    echo Error: Failed to create libinput.a
    goto end
)
gcc simple_test.c libinput.a -o simple_test.exe
if %errorlevel% equ 0 (
    echo.
    echo OK Test compilation successful!
    echo Running test...
    echo.
    simple_test.exe
    echo.
    echo Note: Library not installed. Use core files for your projects.
) else (
    echo Error: Test compilation failed!
)
if exist input.o del input.o
if exist libinput.a del libinput.a
goto end

:test_installation
echo.
echo Testing installation...
if not exist "simple_test.c" (
    echo Error: simple_test.c not found
    goto end
)
set "compile_cmd=gcc simple_test.c -linput -o simple_test.exe"
if "%choice%"=="1" (
    set "compile_cmd=gcc -I"%USERPROFILE%\include" simple_test.c -L"%USERPROFILE%\lib" -linput -o simple_test.exe"
)
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
    if "%choice%"=="1" (
        echo Use in your programs:
        echo   #include ^<input.h^>
        echo Compile with:
        echo   gcc -I"%USERPROFILE%\include" yourprogram.c -L"%USERPROFILE%\lib" -linput -o yourprogram.exe
    ) else (
        echo Use in your programs:
        echo   #include ^<input.h^>
        echo Compile with:
        echo   gcc yourprogram.c -linput -o yourprogram.exe
    )
    echo.
    echo Example program (simple_test.c):
    echo   #include ^<input.h^>
    echo   #include ^<stdio.h^>
    echo   int main() {
    echo       char str[256];
    echo       short num;
    echo       input("Enter a string: ", str);
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