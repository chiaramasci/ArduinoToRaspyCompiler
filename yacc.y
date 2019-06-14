%{
    #include <stdlib.h>
    #include <string.h>
    #include <ctype.h>
    #include <stdio.h>

    extern int yylex(), yyerror();
%}

%union {
    char* lexeme;			
}

%token <lexeme> COMMENT DEFAULT_FUNC VOID PINMODE MODE NUM
/* ehm */
%left error

%type <lexeme> stms def_func func_body pinMode action_cmd body
%start stms
%%
stms:   COMMENT body    {
                            //printf("stms %s\n", $1);
                            char* c = $1;
                            char* comment = malloc(200);
                            strncpy(comment, c+2, 200);

                            printf("# %s\n %s", comment, $2);
                                        
                        };

body:  def_func body   {       
                            //printf("body\n");
                            char outbuf[600];
                            snprintf(outbuf, sizeof(outbuf), " %s \n", $2);
                            $$ = outbuf;
                        }
        | def_func {
                        char outbuf[600];
                        snprintf(outbuf, sizeof(outbuf), " %s \n", $1);
                        $$ = outbuf;
                    };

def_func: VOID DEFAULT_FUNC '(' ')' '{' func_body '}'   {
                                                           // printf("def_func %s %s\n", $1, $2);
                                                            char outbuf[900];
                                                            snprintf(outbuf, sizeof(outbuf), "def %s (): \n %s", $2, $6);
                                                            $$ = outbuf;
                                                        };

func_body: action_cmd func_body {
                                    //printf("func_body 1\n");
                                    char *str = (char*) malloc(strlen($1) + strlen($2) + 1);
                                    strcpy(str, $1);
                                    strcat(str, $2);
                                    $$ = str;
                                }
            
           | action_cmd { 
               $$=$1;
           };

action_cmd: pinMode {
                        $$=$1;
                    };

pinMode: PINMODE '(' NUM ',' MODE ')' ';'   {
                                                //printf("pinmode %s %s %s\n", $1, $3, $5);
                                                char outbuf[100];
                                                char* mode = malloc(20);
                                                if($5 == "INPUT"){
                                                    mode = "GPIO.IN";
                                                }else{
                                                mode = "GPIO.OUT"; 
                                                }
                                                snprintf(outbuf, sizeof(outbuf), "\t GPIO.setup(%s,%s) \n", $3, mode);
                                                $$ = outbuf;
                                            };
%%

#include "lex.yy.c"


int main(int argc, char **argv){

yyparse();
return 0;
}



