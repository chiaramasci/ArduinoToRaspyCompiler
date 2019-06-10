%{
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include <helper.c>
%}

%union {
char* lexeme:
double value;

}

%token <lexeme> ID STRING COMMENT TYPE CALLID INPUT OUTPUT HIGH LOW
%token <value> NUM
%token OP
%token CONST
%token LOOP
%token SETUP



%type <lexeme>  cmd variable fun new old def call params param paramc defid
%start stmts
%%
stms: cmd {fprintf(f, "%s\n", $1);exit(0);} 
    |  COMMENT {fprintf(f, "%s\n", $1);exit(0);} 
    |  cmd stms{fprintf(f, "%s\n", $1);} 
    |  COMMENT stms{fprintf(f, "%s\n", $1);} 
    ;
cmd: variable {$$ = $1;}
    | fun     {$$ = $1;}
    ;
variable: new ';' {$$ = $1;}
    |     old ';' {$$ = $1;}
    ;
new: CONST TYPE ID '=' STRING {$$ = strcat($3,'=', $5);}
    | CONST TYPE ID '=' NUM {$$ = strcat($3,'=', $5);}
    | TYPE ID '=' STRING {$$ = strcat($3,'=', $5);}
    | TYPE ID '=' NUM {$$ = strcat($3,'=', $5);}
    ;
old: ID '=' STRING {$$ = strcat($1,'=', $3);}
    | ID '=' NUM {$$ = strcat($1,'=', $3);}
    ;
fun: def { $$=$1;}
    | call';' {$$= $1;}
    ;
call: CALLID '(' params')' { $$= strcat($1, '(', $3, ')');}
    ;
params: param {$$=$1}
    |    paramc param {$$= strcat($1, $2);}
    |   /*empty*/ {$$="";}
    ;
param: STRING {$$=$1;}
    |  NUM {$$=$1;}
    ;
paramc: param ',' paramc {$$= strcat($1,',',$2) ;}
    |   param ','{$$= strcat($1,',');}
    ;
//%% problema tab
def: TYPE defid '(' params ')' '{' stms '}' {$$=strcat('def', $2, '(', $4, ')',':',$7);}
    ;
defid: SETUP {$$=$1;}
    |   LOOP {$$=$1;}
    |   ID {$$=$1;}
    ;
%%

#include "lex.yy.c"

int main(int argc, char **argv){
    f=fopen("output.py","w");
    if(f== NULL)
{
printf("Error opening file!\n");
exit(1);

yyparse();
return 0;


}

}