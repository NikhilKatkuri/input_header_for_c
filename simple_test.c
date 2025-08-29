#include "core/input.h"
#include <stdio.h>

int main() {
    printf("=== INPUT LIBRARY TEST ===\n\n");
    
    char name[30];
    printf("Enter your name: ");
    input("", name, sizeof(name));
    
    int age = (int)inputLong("Enter your age: ");
    char grade = inputChar("Enter grade (A-F): ");
    
    printf("\n=== RESULTS ===\n");
    printf("Name: %s\n", name);
    printf("Age: %d\n", age);
    printf("Grade: %c\n", grade);
    
    printf("\n✅ Test completed! Library is working.\n");
    return 0;
}
