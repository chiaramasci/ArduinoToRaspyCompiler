%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

/*MUSTER*/
/* Schlüsselwort */
VOID    void
SETUP   setup
PRINT   Serial.print
DWRITE  digitalWrite
DREAD   digitalRead
AWRITE  analogWrite
AREAD   analogRead
PINMODE pinMode
CONST   const
INT     int
FLOAT   float
LONG    long
UNSIGNED    unsigned
CHAR    char
SLEEP   delay
LOOP    loop
HIGH    HIGH
LOW     LOW
HILO    ({HIGH}|{LOW})
INPUT   INPUT   
OUTPUT  OUTPUT 
INOUT   ({INPUT}|{OUTPUT})
TYPE    (void|int|float|long|char)
CALLID  ({PRINT}|{DWRITE}|{DREAD}|{AWRITE}|{AREAD}|{PINMODE}|{SLEEP}|{ID})
/* Operatoren */
EQ      =
OP      [\+\*\/-]
COMP    [<>{EQ}]{1,2}
/* Satzzeichensymbol */
SCOLON  ;
COMMA   ,
COMMENT (\/*(\n)?.*(\n)?\/*|\/\/)
/* Token für Konstanten */
DIGIT   [0-9]
DIGITS  {DIGIT}+
LETTER  [a-zA-Z]
STRING  \"{LETTER}|{DIGIT}+\"

/* Bezeichner */
ID      {LETTER}({LETTER}|{DIGIT})*
NUM     {DIGIT}+(\.{DIGIT}+)?

%%

[ ]     { printf('EMPTY');}

{TYPE}      {printf('TYPE');}
{CONST}     {printf('CONST');}
{STRING}    {printf(' STRING');}
{NUM}       {
            printf(' NUM');}
{INOUT}     {
            printf(' INOUT');}
{HILO}      {
            printf(' HILO');}
{CALLID}    {
            printf(' CALLID');}
{COMMENT}   {
            printf(' COMMENT');}
{ID}        { 
            printf(' ID');}

"("     {printf("(");}
")"     {printf(")";}
"{"     {printf( '{');}
"}"     {printf( '}');}
{OP}    {
        printf('OP');}
"="     {printf( '=');}
";"     {printf( ';');}
","     {printf( ',');}
%%

main()
{
yylex();
}