%option noyywrap

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
%}

COMMENT ((\/[*]((\n)?[^*\/](\n)?)+[*]\/)|(\/\/.*))
DEFAULT_FUNC (loop|setup)
VOID    (void)
PINMODE (pinMode)
MODE    (INPUT|OUTPUT)
DWRITE (digitalWrite)
HILO    (HIGH|LOW)
TYPE_N    (int|float|long)
TYPE_C     (char)
DIGIT    [0-9]
NUM      {DIGIT}+(\.{DIGIT}+)?
LETTER   [a-zA-Z]
ID       {LETTER}({LETTER}|{DIGIT})*
STRING    (\".+\")

%%

[ \n\t]        {}


{COMMENT}   {yylval.lexeme = strdup(yytext); 
            return COMMENT;}

{DEFAULT_FUNC}  {yylval.lexeme = strdup(yytext); 
                return DEFAULT_FUNC;}

{VOID}          {yylval.lexeme = strdup(yytext); 
                return VOID;}

{PINMODE}       {return PINMODE;}
{MODE}          {yylval.lexeme = strdup(yytext); 
                return MODE;}
{NUM}           {yylval.lexeme = strdup(yytext); 
                return NUM;}
{DWRITE}        {return DWRITE;}
{HILO}          {yylval.lexeme = strdup(yytext); 
                return HILO;}
{TYPE_N}          {yylval.lexeme = strdup(yytext); 
                return TYPE_N;}
{TYPE_C}          {yylval.lexeme = strdup(yytext); 
                return TYPE_C;}
{STRING}          {yylval.lexeme = strdup(yytext); 
                return STRING;}
{ID}            {yylval.lexeme = strdup(yytext);
                return ID;}

"("             {return '(';}
")"             {return ')';}
"{"             {return '{';}
"}"             {return '}';}
","             {return ',';}
";"             {return ';';}
"="             {return '=';}


%%