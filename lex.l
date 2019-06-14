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
NUM     [0-9]+

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

"("             {return '(';}
")"             {return ')';}
"{"             {return '{';}
"}"             {return '}';}
","             {return ',';}
";"             {return ';';}


%%