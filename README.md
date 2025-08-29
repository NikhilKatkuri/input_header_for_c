# Input Library - Professional C Input Handling

## 📋 Overview
A robust, safe, and easy-to-use input library for C programming that provides type-safe input functions with automatic error handling and buffer overflow protection.

## 📁 What's Inside

```
input_header/
├── core/
│   ├── input.h          # Header file
│   └── input.c          # Source code
├── INSTALL.bat          # 🌟 Main installer
├── simple_test.c        # Test program
├── compile.bat          # Compilation script
├── README.md           # This file
└── HOW_TO_USE.txt      # Quick guide
```
- **`test/`** - Complete test suite with multiple test programs
  - `basic_test.c` - Simple functionality test
  - `comprehensive_test.c` - Complete function testing
  - `calculator.c` - Example calculator
  - `interactive_demo.c` - Real-world usage examples
  - `run_tests.bat` - Automated test runner

## 🚀 Quick Start

### Step 1: Install the Library
```bash
# For user-specific installation (recommended)
install_user.bat

# For system-wide installation (requires admin)
install_system.bat

# For project-specific use
setup_project.bat
```

### Step 2: Use in Your Programs
```c
#include <input.h>
#include <stdio.h>

int main() {
    char name[50];
    input("Enter your name: ", name, sizeof(name));
    
    int age = (int)inputLong("Enter your age: ");
    float height = inputFloat("Enter your height: ");
    
    printf("Hello %s! You are %d years old and %.2f meters tall.\n", 
           name, age, height);
    return 0;
}
```

### Step 3: Compile and Run
```bash
# Using the provided script
compile.bat myprogram.c

# Test your installation
cd test
run_tests.bat

# Manual compilation (after installation)
gcc -I"%USERPROFILE%\include" myprogram.c -L"%USERPROFILE%\lib" -linput -o myprogram.exe
```

## 📚 Available Functions

| Function | Purpose | Return Value |
|----------|---------|--------------|
| `input()` | String input with buffer protection | Pointer to string |
| `inputShort()` | Short integer input | short (0 on error) |
| `inputLong()` | Long integer input | long (0 on error) |
| `inputLongLong()` | Long long integer input | long long (0 on error) |
| `inputFloat()` | Float input | float (0.0 on error) |
| `inputDouble()` | Double input | double (0.0 on error) |
| `inputLongDouble()` | Long double input | long double (0.0 on error) |
| `inputChar()` | Character input | char ('\0' on error) |

## ✅ Features

- **🛡️ Buffer Overflow Protection** - Safe string input with size limits
- **🔧 Automatic Error Handling** - Returns sensible defaults on invalid input
- **🧹 Input Buffer Cleaning** - Prevents input buffer issues
- **📖 Comprehensive Documentation** - Professional Doxygen-style comments
- **🎯 Type Safety** - Dedicated functions for each data type
- **🚀 Easy Integration** - Simple include and link process

## 🔧 System Requirements

- **Compiler**: GCC (MinGW on Windows)
- **OS**: Windows (with PowerShell)
- **Dependencies**: Standard C library only

## 📝 Example Usage

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
    case 'A': case 'a': /* Handle option A */ break;
    case 'B': case 'b': /* Handle option B */ break;
    case 'C': case 'c': /* Handle option C */ break;
    default: printf("Invalid option!\n");
}
```

## 🐛 Error Handling

All functions handle errors gracefully:
- **String input**: Returns empty string on failure
- **Numeric input**: Returns 0 (or 0.0) on invalid input
- **Character input**: Returns null character '\0' on failure
- **Buffer cleaning**: Automatic cleanup prevents input buffer issues

## 🔄 Version Information

- **Version**: 1.0.0
- **Author**: NikhilKatkuri
- **Date**: August 29, 2025
- **Status**: Production Ready

## 📄 License

This library is free to use for educational and personal projects.

## 🆘 Troubleshooting

### Compilation Issues
1. Ensure GCC is installed and in PATH
2. Run installation script as Administrator if needed
3. Check include and library paths

### Runtime Issues
1. Verify library installation with test program
2. Check buffer sizes for string inputs
3. Validate input ranges for numeric types

---

**Happy Coding! 🚀**
