# Input Library Usage Guide

## Quick Start

### Option 1: Use Local Files (Easiest)
```c
#include "core/input.h"  // Include from local files
#include <stdio.h>

int main() {
    char name[50];
    input("Enter name: ", name, sizeof(name));
    printf("Hello, %s!\n", name);
    return 0;
}
```

**Compile with:**
```bash
gcc yourprogram.c core/input.c -o yourprogram.exe
```

### Option 2: Use Installed Library
```c
#include <input.h>  // Include from system
#include <stdio.h>

int main() {
    char name[50];
    input("Enter name: ", name, sizeof(name));
    printf("Hello, %s!\n", name);
    return 0;
}
```

**Compile with:**
```bash
gcc -I"C:\MinGW\include" yourprogram.c -L"C:\MinGW\lib" -linput -o yourprogram.exe
```

## VS Code Setup

The `.vscode` folder contains configuration files that help VS Code:
- Find header files (eliminates white underlines)
- Provide build tasks (Ctrl+Shift+P → "Tasks: Run Build Task")
- Enable IntelliSense for autocompletion

## Available Functions

- `input(prompt, buffer, size)` - Safe string input
- `inputChar(prompt)` - Single character input
- `inputInt(prompt)` - Integer input
- `inputLong(prompt)` - Long integer input
- `inputFloat(prompt)` - Float input
- `inputDouble(prompt)` - Double input

## Troubleshooting

**White underlines in VS Code?**
- Make sure `.vscode/c_cpp_properties.json` exists
- Reload VS Code window (Ctrl+Shift+P → "Developer: Reload Window")

**"undefined reference" errors?**
- Use the exact compile commands shown above
- Make sure to include either `core/input.c` OR link with `-linput`

**Library not found?**
- Run `INSTALL.bat` as Administrator to install system-wide
- Or use local files approach (Option 1)
