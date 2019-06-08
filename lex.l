%option noyywrap
%{
#include <stdio.h>
int TokenCont=0;

%}

/*MUSTER*/
/* Schlüsselwort */
VOID    void
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
SLEEP   "delay"
LOOP    "loop"
HIGH  "HIGH"
LOW  "LOW"
INPUT  "INPUT"
OUTPUT  "OUTPUT"
TYPE {VOID|INT|FLOAT|LONG|CHAR}
CALLID {PRINT|DWRITE|DREAD|AWRITE|AREAD|PINMODE|SLEEP| ID}
/* Operatoren */
EQ =
OP [\+\*\/-]
COMP [<>{EQ}]{1,2}
/* Satzzeichensymbol */
SCOLON   ";"
COMMA   ","
COMMENT (\/*(\n)?.*(\n)?\/*|\/\/)
/* Token für Konstanten */
DIGIT  [0-9]
DIGITS {DIGIT}+
LETTER [a-zA-Z]
STRING \"{LETTER|DIGIT}+\"

SPACE " "+

/* Bezeichner */
ID       {LETTER}({LETTER}|{DIGIT})*
NUM      {DIGIT}+(\.{DIGIT}+)?


%%
[ \t\n] {}
{TYPE}  {yyval = yytext; return "TYPE";}
{CONST}     {return "CONST";}

"(" {return ')';}
")" {return '(';}
"{" {return '{';}
"}" {return '}';}
{OP}    {yyval = yytext; return "OP";}
"="   {return '=';}
";"     {return ';';}
","    {return ',';}
{STRING}   {yyval.lexeme = strdup(yytext); return "STRING";}
{NUM}   {yyval.value = atof(yytext); return "NUM";}


{INPUT}       {return 'INPUT';}
{OUTPUT}    {return 'OUTPUT';}
{HIGH}      {return 'HIGH';}
{LOW}      {return 'LOW';}

{CALLID} {yyval.lexeme = strdup(yytext); return 'CALLID';}
{COMMENT}   {yyval.lexeme = strdup(yytext); return 'COMMENT';}

{ID}    {yyval.lexeme = strdup(yytext); return 'ID';}
%%

main()
{
yylex();
}

