%{
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
%}


%union {
       char* lexeme;			//identifier
       double value;			//value of an identifier of type NUM
       }

%token <value>  NUM
%token IF
%token <lexeme> ID

%type <value> expr
 /* %type <value> line */

%left '-' '+'
%left '*' '/'
%right UMINUS

%start line

%%
line  : expr '\n'      {printf("Result: %f\n", $1); exit(0);}
      | ID             {printf("Result: %s\n", $1); exit(0);}
      | error          {printf(stderr, "Unvalid line: not an expression and not an identifier");}
      ;
expr  : expr '+' expr  {$$ = $1 + $3;}
      | expr '-' expr  {$$ = $1 - $3;}
      | expr '*' expr  {$$ = $1 * $3;}
      | expr '/' expr  {$$ = $1 / $3;}
      | NUM            {$$ = $1;}
      | '-' expr %prec UMINUS {$$ = -$2;}
      | error          {printf(stderr, "is an unvalid expression");}
      ;

%%

#include "lex.yy.c"

int yyerror(char *s){
    fprintf(stderr, "%s\n",yychar);
}