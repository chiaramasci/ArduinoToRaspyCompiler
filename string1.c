#include <stdio.h>

#include <string.h>

char[] func(char str[])
{

    /* To print string in upperCase*/
    for (int i = 0; i <= strlen(str); i++)
    {
        if (str[i] >= 97 && str[i] <= 122)
            str[i] = str[i] - 32;
    }
    printf("\n\nString in Uppercase: %s", str);
}

void concatenate(char first[], char second[], char third[])
{
    char result[100];

    strcpy(result, first);
    strcat(result, "puzzi ");
    strcat(result, second);
    strcat(result, " ");
    strcat(result, "Third ");
    strcat(result, third);

    printf("%s", result);
}

void main()
{
    char result[100];    // Make sure you have enough space (don't forget the null)
    char second[] = " "; // Array initialisation in disguise
    char fourth[] = " ";

    //strcpy(result, "First string ");
    //strcat(result, "puzzi ");
    //strcat(result, second);
    //strcat(result, " ");
    //strcat(result, "Third ");
    //strcat(result, fourth);
    char a[] = "ciao";
    char b[] = "so";
    char c[] = "parlare";
    //printf("%s", result);
    char boh[] = func(a);
    concatenate(boh, b, c);
}