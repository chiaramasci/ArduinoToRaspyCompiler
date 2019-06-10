#include <stdio.h>

#include <string.h>
void func(char str[])
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
    strcat(result, second);
    strcat(result, third);

    printf("%s", result);
}

void main()
{

    char str[100];

    char result[100];
    char a[] = "ciao";
    char b[] = "so";
    char c[] = "parlare";
    concatenate(a, b, c);

    func(result);
}