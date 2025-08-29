#!/bin/bash
# Cross-platform Input Library Installer
# Supports: Windows (MinGW via Git Bash/WSL), Linux, macOS
# Author: NikhilKatkuri

set -e  # Exit on any error

echo "====================================="
echo "  Building libinput.a for your system"
echo "====================================="

# Detect OS
OS=$(uname -s)

if [[ "$OS" == "Linux" || "$OS" == "Darwin" ]]; then
    echo "Detected OS: $OS"
    
    INCLUDE_PATH="/usr/local/include"
    LIB_PATH="/usr/local/lib"
    
    if ! command -v gcc &> /dev/null; then
        echo "Error: GCC not found! Install GCC first."
        exit 1
    fi
    
    # Compile and create library
    echo "Compiling input.c ..."
    gcc -c core/input.c -o core/input.o
    
    echo "Creating libinput.a ..."
    ar rcs core/libinput.a core/input.o
    
    # Copy files to system paths
    echo "Copying input.h to $INCLUDE_PATH ..."
    sudo cp core/input.h "$INCLUDE_PATH/"
    
    echo "Copying libinput.a to $LIB_PATH ..."
    sudo cp core/libinput.a "$LIB_PATH/"
    
    # Cleanup
    rm core/input.o core/libinput.a

elif [[ "$OS" == MINGW* || "$OS" == MSYS* || "$OS" == CYGWIN* ]]; then
    echo "Detected Windows (MinGW/WSL)"
    
    read -p "Enter your MinGW root folder (e.g. C:/MinGW): " MINGWROOT
    if [ ! -d "$MINGWROOT" ]; then
        echo "ERROR: Path $MINGWROOT not found!"
        exit 1
    fi
    
    echo "Compiling input.c ..."
    gcc -c core/input.c -Icore -o core/input.o
    
    echo "Creating libinput.a ..."
    ar rcs core/libinput.a core/input.o
    
    echo "Copying input.h to $MINGWROOT/include ..."
    cp -f core/input.h "$MINGWROOT/include/"
    
    echo "Copying libinput.a to $MINGWROOT/lib ..."
    cp -f core/libinput.a "$MINGWROOT/lib/"
    
    # Cleanup
    rm core/input.o core/libinput.a

else
    echo "Unsupported OS: $OS"
    exit 1
fi

echo "====================================="
echo "Library installed successfully!"
echo "Use: #include <input.h>"
echo "Compile with: gcc main.c -linput"
echo "====================================="
