/**
 * @file input.h
 * @brief Safe and robust user input library for C programs
 * @version 1.0
 * @date 2025-08-29
 * @author NikhilKatkuri
 *
 * This library provides type-safe input functions with proper error handling
 * and buffer overflow protection. All functions handle invalid input gracefully
 * by returning sensible default values and clearing the input buffer.
 *
 * @note All numeric input functions automatically clear the input buffer
 *       to prevent issues with subsequent input operations.
 *
 * @warning Always provide adequate buffer size for string input to prevent overflow.
 *
 * Example usage:
 * @code
 * #include "input.h"
 *
 * char name[50];
 * input("Enter your name: ", name, sizeof(name));
 *
 * int age = (int)inputLong("Enter your age: ");
 * float height = inputFloat("Enter your height: ");
 * @endcode
 */

#ifndef INPUT_H
#define INPUT_H

#include <stdio.h>
#include <stddef.h> /* for size_t */

/* Version information */
#define INPUT_LIB_VERSION_MAJOR 1
#define INPUT_LIB_VERSION_MINOR 0
#define INPUT_LIB_VERSION_PATCH 0

/* Input buffer limits */
#define INPUT_MAX_BUFFER_SIZE 4096
#define INPUT_DEFAULT_BUFFER_SIZE 256

/**
 * @brief Safe string input function with buffer overflow protection
 *
 * Reads a line of text from standard input, automatically removing the trailing
 * newline character. Provides buffer overflow protection by respecting the
 * specified buffer size limit.
 *
 * @param message Prompt message to display to the user (can be empty string "")
 * @param buffer Pointer to character array where input will be stored
 * @param buffer_size Maximum number of characters to read (including null terminator)
 *
 * @return Pointer to the input string (same as buffer parameter)
 *
 * @retval buffer Pointer to successfully read string
 * @retval buffer Pointer to empty string if input fails or EOF encountered
 *
 * @note The function automatically removes trailing newline characters
 * @note Returns empty string on input failure rather than NULL for consistency
 * @note Buffer is always null-terminated regardless of input length
 *
 * @warning Ensure buffer_size matches actual buffer capacity to prevent overflow
 * @warning Do not pass NULL as buffer parameter
 *
 * @see inputChar() for single character input
 *
 * Example:
 * @code
 * char username[32];
 * input("Username: ", username, sizeof(username));
 * printf("Hello, %s!\n", username);
 * @endcode
 */
char *input(const char *message, char *buffer, size_t buffer_size);

/**
 * @brief Read an integer from user input
 *
 * Prompts the user for an integer value with automatic input validation
 * and buffer clearing. Handles invalid input gracefully by returning zero.
 *
 * @param message Prompt message to display to the user
 *
 * @return The input integer value, or 0 if input is invalid
 *
 * @retval int Valid integer entered by user
 * @retval 0 If input is not a valid integer
 *
 * @note Input buffer is automatically cleared after reading
 * @note Accepts input in decimal format only
 * @note Range: typically -2,147,483,648 to 2,147,483,647 (platform dependent)
 *
 * Example:
 * @code
 * int age = inputInt("Enter your age: ");
 * if (age > 0) {
 *     printf("You are %d years old\n", age);
 * }
 * @endcode
 */
int inputInt(const char *message);

/**
 * @brief Read a short integer from user input
 *
 * Prompts the user for a short integer value with automatic input validation
 * and buffer clearing. Handles invalid input gracefully by returning zero.
 *
 * @param message Prompt message to display to the user
 *
 * @return The input short integer value, or 0 if input is invalid
 *
 * @retval short Valid short integer entered by user
 * @retval 0 If input is not a valid short integer
 *
 * @note Input buffer is automatically cleared after reading
 * @note Accepts input in decimal format only
 * @note Range: typically -32,768 to 32,767 (platform dependent)
 *
 * Example:
 * @code
 * short count = inputShort("Enter count: ");
 * if (count > 0) {
 *     printf("Processing %hd items\n", count);
 * }
 * @endcode
 */
short inputShort(const char *message);

/**
 * @brief Read a long integer from user input
 *
 * Prompts the user for a long integer value with automatic input validation
 * and buffer clearing. Handles invalid input gracefully by returning zero.
 *
 * @param message Prompt message to display to the user
 *
 * @return The input long integer value, or 0 if input is invalid
 *
 * @retval long Valid long integer entered by user
 * @retval 0 If input is not a valid long integer
 *
 * @note Input buffer is automatically cleared after reading
 * @note Accepts input in decimal format only
 * @note Range: typically -2,147,483,648 to 2,147,483,647 (platform dependent)
 *
 * Example:
 * @code
 * long population = inputLong("Enter city population: ");
 * printf("Population: %ld\n", population);
 * @endcode
 */
long inputLong(const char *message);

/**
 * @brief Read a long long integer from user input
 *
 * Prompts the user for a long long integer value with automatic input validation
 * and buffer clearing. Handles invalid input gracefully by returning zero.
 *
 * @param message Prompt message to display to the user
 *
 * @return The input long long integer value, or 0 if input is invalid
 *
 * @retval "long long" Valid long long integer entered by user
 * @retval 0 If input is not a valid long long integer
 *
 * @note Input buffer is automatically cleared after reading
 * @note Accepts input in decimal format only
 * @note Range: typically -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
 *
 * Example:
 * @code
 * long long file_size = inputLongLong("Enter file size in bytes: ");
 * printf("File size: %lld bytes\n", file_size);
 * @endcode
 */
long long inputLongLong(const char *message);

/**
 * @brief Read a floating-point number from user input
 *
 * Prompts the user for a float value with automatic input validation
 * and buffer clearing. Handles invalid input gracefully by returning zero.
 *
 * @param message Prompt message to display to the user
 *
 * @return The input float value, or 0.0f if input is invalid
 *
 * @retval float Valid floating-point number entered by user
 * @retval 0.0f If input is not a valid float
 *
 * @note Input buffer is automatically cleared after reading
 * @note Accepts decimal notation (e.g., 3.14, -2.5)
 * @note Scientific notation supported (e.g., 1.23e-4)
 * @note Precision: typically 6-7 decimal digits
 *
 * Example:
 * @code
 * float temperature = inputFloat("Enter temperature in Celsius: ");
 * printf("Temperature: %.2f°C\n", temperature);
 * @endcode
 */
float inputFloat(const char *message);

/**
 * @brief Read a double-precision floating-point number from user input
 *
 * Prompts the user for a double value with automatic input validation
 * and buffer clearing. Handles invalid input gracefully by returning zero.
 *
 * @param message Prompt message to display to the user
 *
 * @return The input double value, or 0.0 if input is invalid
 *
 * @retval double Valid double-precision floating-point number entered by user
 * @retval 0.0 If input is not a valid double
 *
 * @note Input buffer is automatically cleared after reading
 * @note Accepts decimal notation (e.g., 3.141592653589793)
 * @note Scientific notation supported (e.g., 1.23456789e-10)
 * @note Precision: typically 15-17 decimal digits
 *
 * Example:
 * @code
 * double pi = inputDouble("Enter value of PI: ");
 * printf("PI = %.15f\n", pi);
 * @endcode
 */
double inputDouble(const char *message);

/**
 * @brief Read an extended-precision floating-point number from user input
 *
 * Prompts the user for a long double value with automatic input validation
 * and buffer clearing. Handles invalid input gracefully by returning zero.
 *
 * @param message Prompt message to display to the user
 *
 * @return The input long double value, or 0.0L if input is invalid
 *
 * @retval "long double" Valid extended-precision floating-point number entered by user
 * @retval 0.0L If input is not a valid long double
 *
 * @note Input buffer is automatically cleared after reading
 * @note Accepts decimal notation with extended precision
 * @note Scientific notation supported
 * @note Precision: platform dependent, typically 19+ decimal digits
 *
 * Example:
 * @code
 * long double precise_value = inputLongDouble("Enter high-precision value: ");
 * printf("Value: %.19Lf\n", precise_value);
 * @endcode
 */
long double inputLongDouble(const char *message);

/**
 * @brief Read a single character from user input
 *
 * Prompts the user for a single character with automatic input validation
 * and buffer clearing. Handles invalid input gracefully by returning null character.
 *
 * @param message Prompt message to display to the user
 *
 * @return The input character, or '\\0' if input is invalid
 *
 * @retval char Valid character entered by user (including whitespace)
 * @retval '\\0' If input fails or EOF is encountered
 *
 * @note Input buffer is automatically cleared after reading
 * @note Leading whitespace is automatically skipped
 * @note Only the first non-whitespace character is returned
 * @note Remaining input on the line is discarded
 *
 * Example:
 * @code
 * char choice = inputChar("Continue? (y/n): ");
 * if (choice == 'y' || choice == 'Y') {
 *     printf("Continuing...\n");
 * }
 * @endcode
 */
char inputChar(const char *message);

#endif /* INPUT_H */