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

%token <lexeme> COMMENT DEFAULT_FUNC VOID PINMODE MODE NUM DWRITE HILO TYPE_N ID TYPE_C STRING
/* ehm */
%left error

%type <lexeme> stms def_func func_body pinMode action_cmd body comment cmd var_n_cmd var_cmd var_c_cmd
%start stms
%%
stms:   comment body    {
                            //printf("stms %s\n", $1);
                            char* c = $1;
                            char* comment = malloc(200);
                            strncpy(comment, c+2, 200);
                                        
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

func_body: cmd func_body 
           | cmd {}
           ;

cmd: action_cmd
    | var_cmd {}
    ;

action_cmd: pinMode
            | digitalWrite {}
            ;

var_cmd: var_n_cmd
        | var_c_cmd {}
        ;

var_c_cmd: TYPE_C ID '=' STRING ';' {
                            char outbuf[100];
                            char* mode = malloc(20);
                            snprintf(outbuf, sizeof(outbuf), "\t %s = %s \n", $2, $4);
                            printf("%s",outbuf);
};

var_n_cmd: TYPE_N ID '=' NUM ';'{
                            char outbuf[100];
                            char* mode = malloc(20);
                            snprintf(outbuf, sizeof(outbuf), "\t %s = %s \n", $2, $4);
                            printf("%s",outbuf);
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
                                            };

digitalWrite: DWRITE '(' NUM ',' HILO ')' ';'{
                                            char outbuf[100];
                                            char* mode = malloc(20);
                                            if($5 == "HIGH"){
                                                mode = "GPIO.HIGH";
                                            }else{
                                            mode = "GPIO.LOW"; 
                                            }
                                            snprintf(outbuf, sizeof(outbuf), "\t GPIO.output(%s,%s) \n", $3, mode);
                                            printf("%s",outbuf);
}
%%

#include "lex.yy.c"


int main(int argc, char **argv){

yyparse();
return 0;
}



