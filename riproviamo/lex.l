%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

COMMENT ((\/[*]((\n)?[^*\/](\n)?)+[*]\/)|(\/\/.*))

%%
{COMMENT}   {yylval.lexeme = strdup(yytext); 
            return COMMENT;}
%%