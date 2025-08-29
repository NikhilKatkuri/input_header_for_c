#include <input.h>  // Use this if library is installed system-wide
// #include "core/input.h"  // Use this if using local files
#include <stdio.h>

int main() {
    printf("=== Input Library Example ===\n\n");
    
    // String input with buffer size protection
    char name[50];
    input("Enter your name: ", name, sizeof(name));
    
    // Numeric inputs
    int age = (int)inputLong("Enter your age: ");
    float height = inputFloat("Enter your height (cm): ");
    char grade = inputChar("Enter your grade (A-F): ");
    
    // Display results
    printf("\n=== Your Information ===\n");
    printf("Name: %s\n", name);
    printf("Age: %d years\n", age);
    printf("Height: %.1f cm\n", height);
    printf("Grade: %c\n", grade);
    
    printf("\nPress any key to continue...\n");
    inputChar("");
    
    return 0;
}
