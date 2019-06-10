#include <stdio.h>

#include <string.h>
char *func(char *str)
{
    char result[100];

    /* To print string in upperCase*/
    for (int i = 0; i <= strlen(str); i++)
    {
        if (str[i] >= 97 && str[i] <= 122)
            result[i] = str[i] - 32;
    }

    return result;
}

char *concatenate(char first[], char second[], char third[])
{
    char result[100];

    strcpy(result, first);
    strcat(result, second);
    strcat(result, third);
    return result;
}

void main()
{

    char str[100];

    char result[100];
    char a[] = "ciao";
    char b[] = "so";
    char c[] = "parlare";
    char *concatenated = concatenate(a, b, c);

    char *uppercase = func(concatenated);
    printf("%s", uppercase);
}