%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror(char *s);

int result;  // Declare result variable
%}

%token number
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
A: E { $$=$1; printf("Result of Arithmetic Expression is: %d\n", $$); exit(0);}
  ;

E: E '+' E { $$ = $1 + $3; }
  | E '-' E { $$ = $1 - $3; }
  | E '*' E { $$ = $1 * $3; }
  | E '/' E { $$ = $1 / $3; }
  | E '%' E { $$ = $1 % $3; }
  | '(' E ')' { $$ = $2; }
  | number { $$ = $1; }
  ;

%%

int yyerror(char *s) {
    printf("Invalid Arithmetic Expression\n");
    return 0;
}

int main() {
    printf("Enter the Arithmetic Expression: ");
    yyparse();
    return 0;
}

