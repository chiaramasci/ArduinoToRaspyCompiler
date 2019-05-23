%option noyywrap
%{
#include <stdio.h>
int TokenCont=0;

%}




stringconst \"({letter}|{digit})+\"

DIGIT  [0-9]
DIGITS {DIGIT}+
LETTER [a-zA-Z]
STRING {LETTER|DIGIT}+

VOID    "void"
COMMENT ("//.*"|"/\*[.]*\*/")
SETUP   "setup"
OBRA    "("
CBRA    ")"
OCBRA   "{"
CCBRA   "}"
PRINT   "Serial.print"
DWRITE  "digitalWrite"
DREAD   "digitalRead"
AWRITE  "analogWrite"
AREAD   "analogRead"
HIGH  "HIGH"
LOW  "LOW"
PINMODE "pinMode"
INPUT  "INPUT"
OUTPUT  "OUTPUT"
CONST   "const"
INT     "int"
FLOAT   "float"
LONG   "long"
UNSIGNED "unsigned"
CHAR    "char"
SLEEP   "sleep"
LOOP    "loop"
SPACE " "+


%%
[ \t\n] {}
{VOID}      {printf("void\n");}
{INT}       {printf("int\n");}
{FLOAT}     {printf("float\n");}
{CHAR}      {printf("char\n");}

{OBRA} {printf("open bracket");}
{CBRA} {printf("closed bracket");}
{OCBRA} {printf("open curly bracket");}
{CCBRA} {printf("closed curly bracket");}
"+"     {return '+';}
"-"     {return '-';}
"*"     {return '*';}
"/"     {return '/';}
";"     {printf("semicolon")}


{INPUT}       {printf("input");}
{OUTPUT}    {printf("output");}
{HIGH}      {printf("high");}
{LOW}      {printf("low");}

{PRINT} {printf("print: %s",yytext);}
{DWRITE}    {printf("digitalWrite");}
{PINMODE}       {printf("pinMode");}
{SETUP}         {printf("setup\n");}
{DREAD}  {printf("digitalRead");}
{LOOP}  {printf("loop");}
{SLEEP}  {printf("sleep");}
{COMMENT}   {printf("comment");}

.*          {printf("else");}
%%

main()
{
yylex();
}