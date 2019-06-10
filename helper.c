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

char *conc3(char first[], char second[], char third[])
{
    char result[100];

    strcpy(result, first);
    strcat(result, second);
    strcat(result, third);
    return result;
}

char *conc4(char first[], char second[], char third[], char fourth[])
{
    char result[100];

    strcpy(result, first);
    strcat(result, second);
    strcat(result, third);
    strcat(result, fourth);
    return result;
}

char *conc7(char first[], char second[], char third[], char fourth[], char fifth[], char sixth[], char seventh[])
{
    char result[100];

    strcpy(result, first);
    strcat(result, second);
    strcat(result, third);
    strcat(result, fourth);
    strcat(result, fifth);
    strcat(result, sixth);
    strcat(result, seventh);
    return result;
}