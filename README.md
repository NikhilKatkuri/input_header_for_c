# Input Library - Professional C Input Handling

## 📋 Overview

A robust, safe, and easy-to-use input library for C programming that provides type-safe input functions with automatic error handling and buffer overflow protection.

## 👁️ What's Inside

```
input_header/
├── core/
│   ├── input.h          # Header file
│   └── input.c          # Source code
├── INSTALL.bat          # 🌟 Main installer for Windows
├── INSTALL.sh           # 🌟 Installer for Linux/macOS
├── README.md            # This file
```

## 🚀 Quick Start

### Step 1: Install the Library

**Windows:**

1. Right-click on `INSTALL.bat` and run as Administrator.
2. Enter your MinGW path (e.g., `C:\MinGW`) when prompted.

**Linux/macOS:**

```bash
chmod +x INSTALL.sh
sudo ./INSTALL.sh
```

### Step 2: Compile and Run

```bash
# Compile your program
gcc file.c -o file -linput

# Run your program
./file
```

### Step 3: VSCode Setup (Optional)

1. Press Ctrl + Shift + P → `Preferences: Open User Settings (JSON)`.
2. Add/replace `code-runner.executorMap` for C:

```json
"c": "cd $dir && gcc $fileName -o $fileNameWithoutExt.exe -linput && ./$fileNameWithoutExt.exe"
```

3. Associate `input.h` in `.vscode/settings.json`:

```json
{
     "files.associations": {
          "input.h": "c"
     }
}
```

## 📚 Available Functions

| Function            | Purpose                             | Return Value               |
| ------------------- | ----------------------------------- | -------------------------- |
| `input()`           | String input with buffer protection | Pointer to string          |
| `inputInt()`        | Integer input                       | int (0 on error)           |
| `inputShort()`      | Short integer input                 | short (0 on error)         |
| `inputLong()`       | Long integer input                  | long (0 on error)          |
| `inputLongLong()`   | Long long integer input             | long long (0 on error)     |
| `inputFloat()`      | Float input                         | float (0.0 on error)       |
| `inputDouble()`     | Double input                        | double (0.0 on error)      |
| `inputLongDouble()` | Long double input                   | long double (0.0 on error) |
| `inputChar()`       | Character input                     | char ('\0' on error)       |

## ✅ Features

* **🛡️ Buffer Overflow Protection** - Safe string input with size limits
* **🔧 Automatic Error Handling** - Returns sensible defaults on invalid input
* **🧹 Input Buffer Cleaning** - Prevents input buffer issues
* **🔖 Comprehensive Documentation** - Professional Doxygen-style comments
* **🎯 Type Safety** - Dedicated functions for each data type
* **🚀 Easy Integration** - Simple include and link process

## 🔧 System Requirements

* **Compiler**: GCC (MinGW on Windows)
* **OS**: Windows / Linux / macOS
* **Dependencies**: Standard C library only

## 📖 Example Usage

### Basic Input

```c
char username[32];
input("Username: ", username, sizeof(username));
```

### Numeric Input with Validation

```c
int age = (int)inputLong("Enter age: ");
if (age <= 0) {
    printf("Invalid age entered!\n");
}
```

### Menu Selection

```c
char choice = inputChar("Select option (A/B/C): ");
switch(choice) {
    case 'A': case 'a': break;
    case 'B': case 'b': break;
    case 'C': case 'c': break;
    default: printf("Invalid option!\n");
}
```

## 💡 Error Handling

* **String input**: Returns empty string on failure
* **Numeric input**: Returns 0 (or 0.0) on invalid input
* **Character input**: Returns null character '\0' on failure
* **Buffer cleaning**: Automatic cleanup prevents input buffer issues

## 🔄 Version Information

* **Version**: 1.0.0
* **Author**: NikhilKatkuri
* **Date**: August 29, 2025
* **Status**: Production Ready

## 📝 License

This library is free to use for educational and personal projects.

## 🛠️ Troubleshooting

### Compilation Issues

1. Ensure GCC is installed and in PATH
2. Run installation script as Administrator if needed
3. Check include and library paths

### Runtime Issues

1. Verify library installation with a test program
2. Check buffer sizes for string inputs
3. Validate input ranges for numeric types

---

**Happy Coding! 🚀**
