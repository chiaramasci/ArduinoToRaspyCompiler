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
%left ''

%type <lexeme> cmd variable fun new old def call params param paramc defid s type l stms
%start stms
%%
s:  stms {$$=$1;}
    | EMPTY {$$=$1;}
    ;
stms: cmd s{fprintf(f, "%s\n", $1);exit(0);} 
    | COMMENT s{fprintf(f, "%s\n", $1);exit(0);} 
    ;
cmd: variable {$$ = $1;}
    | fun     {$$ = $1;}
    ;
variable: new ';' {$$ = $1;}
    |     old ';' {$$ = $1;}
    ;
type: STRING {$$=$1;}
    | NUM   {$$=$1;}
    ;
new: CONST TYPE ID '=' type {$$ = conc3($3,'=', $5);}
    | TYPE ID '=' type {$$ = conc3($2,'=', $4);}
    ;
old: ID '=' type {$$ = conc3($1,'=', $3);}
    ;
fun: def { $$=$1;}
    | call';' {$$= $1;}
    ;
    /*WRONg*/
call: CALLID '(' params ')' { $$= conc4($1, '(', $3, ')');}
    ;
params: param {$$=$1;}
    |   paramc param {$$= strcat($1, $2);}
    |   EMPTY {$$=$1;}
    ;
paramc: param ',' l {$$= conc3($1,',',$3);}
    ;
l:  paramc {$$=$1;}
    | EMPTY {$$=$1;}
    ;
param: STRING {$$=$1;}
    |  NUM {$$=$1;}
    ;
    /* problema taaab!!*/
defid: SETUP {$$=$1;}
    |   LOOP {$$=$1;}
    |   ID {$$=$1;}
    ;
def: TYPE defid '(' params ')' '{' stms '}' {$$=conc7('def', $2, '(', $4, ')',':',$7);}
    ;
%%

#include "lex.yy.c"

int main(int argc, char **argv){
    f = fopen("output.py","w");
    if ( f == NULL) {
        printf("Error opening file!\n");
        exit(1);
        }

yyparse();
return 0;


}

