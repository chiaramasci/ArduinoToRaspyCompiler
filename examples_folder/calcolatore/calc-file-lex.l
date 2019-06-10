%option noyywrap
%{
#include <stdlib.h>
#include <string.h>
%}

DIGIT    [0-9]
NUM      {DIGIT}+(\.{DIGIT}+)?

LETTER   [a-zA-Z]
ID       {LETTER}({LETTER}|{DIGIT})*

TYPE    (void|int|float|long|char)


%%

[ ]     { /* skip blanks */ }

[iI][fF] {return IF;}
{TYPE}      {yyval.lexeme = strdup(yytext); 
            return TYPE;}
{NUM}    {yylval.value = atof(yytext);
          return NUM;}
{ID}     {yylval.lexeme = strdup(yytext);
          return ID;}

"+"     {return '+';}
"-"     {return '-';}
"*"     {return '*';}
"/"     {return '/';}
\n      {return '\n';}
  


%%