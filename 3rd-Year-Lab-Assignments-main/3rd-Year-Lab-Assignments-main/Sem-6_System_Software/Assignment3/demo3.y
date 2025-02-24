%{
#include<stdio.h>
#include<stdlib.h>
%}
%token A B NL
%% 
stmt: S NL {printf("valid string"); exit(0);}
;
S:A S B |
;
%% 
int yyerror(char *str)
{
printf("Invalid String");
}
int main(){
printf("Enter the input String=");
	yyparse();
}
