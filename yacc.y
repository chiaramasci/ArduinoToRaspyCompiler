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

%type <lexeme> stms def_func func_body pinMode action_cmd body comment
%start stms
%%
stms:   comment body    {
                            //printf("stms %s\n", $1);
                            char* c = $1;
                            char* comment = malloc(200);
                            strncpy(comment, c+2, 200);

                            //printf("# %s\n", comment, $2);
                                        
                        };

comment: COMMENT {char* c = $1;
                char* comment = malloc(200);
                strncpy(comment, c+2, 200);
                printf("# %s \n",comment);
                };

body:  def_func def_func   {       

                        };

def_func: VOID DEFAULT_FUNC {char outbuf[900];
                            snprintf(outbuf, sizeof(outbuf), "def %s (): \n ", $2);
                            printf("%s\n", outbuf);} 
        '(' ')' '{' func_body '}'   { };

func_body: action_cmd func_body {
                                    
                                    // char *str = (char*) malloc(strlen($1) + strlen($2) + 1);
                                    // strcpy(str, $1);
                                    // strcat(str, $2);
                                    // $$ = str;
                                }
            
           | action_cmd { 
            //    $$=$1;
           };

action_cmd: pinMode {
                        $$=$1;
                    };

pinMode: PINMODE '(' NUM ',' MODE ')' ';'   {
                                                char outbuf[100];
                                                char* mode = malloc(20);
                                                if($5 == "INPUT"){
                                                    mode = "GPIO.IN";
                                                }else{
                                                mode = "GPIO.OUT"; 
                                                }
                                                snprintf(outbuf, sizeof(outbuf), "\t GPIO.setup(%s,%s) \n", $3, mode);
                                                printf("%s",outbuf);
                                                // $$ = outbuf;
                                            };
%%

#include "lex.yy.c"


int main(int argc, char **argv){

yyparse();
return 0;
}



