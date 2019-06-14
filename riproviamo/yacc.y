%{
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
#include "helper.c"

FILE *f;
%}

%union {
       char* lexeme;			//identifier
       }

%token <lexeme> ID STRING COMMENT TYPE CALLID INPUT OUTPUT HIGH LOW SETUP LOOP CONST OP INOUT HILO NUM EMPTY

/* ehm */
%left error

%type <lexeme> cmd variable fun new old def call params param paramc defid s type l stms
%start stms
%%
s:  stms {$$=$1;}
    | EMPTY {$$=$1;}
    ;
stms: cmd     {printf("%s\n", $1);exit(0);} 
    | COMMENT {printf("%s\n", $1);exit(0);} 
    | error     {printf(stderr, "smts");}
    ;
%%

#include "lex.yy.c"

int yyerror(char *s){
    fprintf(stderr, "%s\n",yychar);
}

int main(int argc, char **argv){

yyparse();
return 0;
}



