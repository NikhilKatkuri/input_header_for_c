#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "input.h"

char *input(const char *message, char *buffer, size_t buffer_size)
{
     printf("%s", message);

     if (fgets(buffer, buffer_size, stdin) == NULL)
     {
          // Handle error internally
          buffer[0] = '\0'; // return empty string if input fails
     }
     else
     {
          // Remove newline
          buffer[strcspn(buffer, "\n")] = '\0';
     }

     return buffer;
}

int inputInt(const char *message)
{
     int value;
     printf("%s", message);
     if (scanf("%d", &value) != 1)
     {
          value = 0;
     }
     // clear leftover input buffer
     int c;
     while ((c = getchar()) != '\n' && c != EOF)
     {
     }
     return value;
}

short inputShort(const char *message)
{
     short value;
     printf("%s", message);
     if (scanf("%hd", &value) != 1)
     {
          value = 0;
     }
     // clear leftover input buffer
     int c;
     while ((c = getchar()) != '\n' && c != EOF)
     {
     }
     return value;
}

long inputLong(const char *message)
{
     long value;
     printf("%s", message);
     if (scanf("%ld", &value) != 1)
     {
          value = 0;
     }
     // clear leftover input buffer
     int c;
     while ((c = getchar()) != '\n' && c != EOF)
     {
     }
     return value;
}

long long inputLongLong(const char *message)
{
     long long value;
     printf("%s", message);
     if (scanf("%lld", &value) != 1)
     {
          value = 0;
     }
     // clear leftover input buffer
     int c;
     while ((c = getchar()) != '\n' && c != EOF)
     {
     }
     return value;
}

float inputFloat(const char *message)
{
     float value;
     printf("%s", message);
     if (scanf("%f", &value) != 1)
     {
          value = 0;
     }
     // clear leftover input buffer
     int c;
     while ((c = getchar()) != '\n' && c != EOF)
     {
     }
     return value;
}

double inputDouble(const char *message)
{
     double value;
     printf("%s", message);
     if (scanf("%lf", &value) != 1)
     {
          value = 0;
     }
     // clear leftover input buffer
     int c;
     while ((c = getchar()) != '\n' && c != EOF)
     {
     }
     return value;
}

long double inputLongDouble(const char *message)
{
     long double value;
     printf("%s", message);
     if (scanf("%Lf", &value) != 1)
     {
          value = 0;
     }
     // clear leftover input buffer
     int c;
     while ((c = getchar()) != '\n' && c != EOF)
     {
     }
     return value;
}

char inputChar(const char *message)
{
     char value;
     printf("%s", message);
     if (scanf(" %c", &value) != 1)
     {
          value = '\0';
     }
     // clear leftover input buffer
     int c;
     while ((c = getchar()) != '\n' && c != EOF)
     {
     }
     return value;
}
