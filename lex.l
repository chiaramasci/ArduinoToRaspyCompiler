%option noyywrap
%{
#include <stdio.h>
int TokenCont=0;

%}

/*MUSTER*/
/* Schlüsselwort */
VOID    [^void$]
SETUP   setup
PRINT   Serial.print
DWRITE  "digitalWrite"
DREAD   "digitalRead"
AWRITE  "analogWrite"
AREAD   "analogRead"
PINMODE "pinMode"
CONST   "const"
INT     "int"
FLOAT   "float"
LONG   "long"
UNSIGNED "unsigned"
CHAR    "char"
SLEEP   "sleep"
LOOP    "loop"
HIGH  "HIGH"
LOW  "LOW"
INPUT  "INPUT"
OUTPUT  "OUTPUT"
/* Operatoren */
OP [\+\*\/-]
COMP [<>=]{1,2}
/* Satzzeichensymbol */
OBRA    "("
CBRA    ")"
OCBRA   "{"
CCBRA   "}"
SCOLON   ";"
COMMA   ","
COMMENT (\/*(\n)?.*(\n)?\/*|\/\/)
/* Token für Konstanten */
DIGIT  [0-9]
DIGITS {DIGIT}+
LETTER [a-zA-Z]
STRING {LETTER|DIGIT}+

SPACE " "+

/* Bezeichner */
ID       {LETTER}({LETTER}|{DIGIT})*
NUM      {DIGIT}+(\.{DIGIT}+)?


%%
[ \t\n] {}
{VOID}      {return "VOID";}
{INT}       {return "INT";}
{FLOAT}     {return "FLOAT";}
{CHAR}      {return "CHAR";}

{OBRA} {return "OBRA";}
{CBRA} {return "CBRA";}
{OCBRA} {return "OBRA";}
{CCBRA} {return "CCBRA";}
{OP}    {yyval = yytext; return "OP";}
{SCOLON}     {return "SCOLON";}
{COMMA}     {return "COMMA";}


{INPUT}       {return "INPUT";}
{OUTPUT}    {return "OUTPUT";}
{HIGH}      {return "HIGH";}
{LOW}      {return "LOW";}

{PRINT} {return "PRINT";}
{DWRITE}    {return "DWRITE";}
{PINMODE}       {return "PINMODE";}
{SETUP}         {return "SETUP";}
{DREAD}  {return "DREAD";}
{LOOP}  {return "LOOP";}
{SLEEP}  {return "SLEEP";}
{COMMENT}   {yyval = yytext); return "COMMENT";}

{ID}    {yyval = yytext; return "ID";}
%%

main()
{
yylex();
}