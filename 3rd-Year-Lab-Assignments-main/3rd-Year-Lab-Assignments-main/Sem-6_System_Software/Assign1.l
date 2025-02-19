%{
#include<stdio.h>
int a,b;
%}
%%
["].*["] {printf("\nLiterals-:%s",yytext);}
[a-z]+[.][h] {printf("\nHeader file-:%s",yytext);}
# {printf("\nPreprocessor Directive-:%s",yytext);}
void|main|include|if|else|getch|return {printf("\nKeyword-:%s",yytext);}
"<"|">"|","|";"|"("|")"|"{"|"}" {printf("\nPunctions-:%s",yytext);}
int|float|char|double {printf("\nDatatypes-:%s",yytext);}
[a-zA-Z_][A-Za-z0-9_]* {printf("\nIdentifiers-:%s",yytext);}
[0-9]+ {printf("\nInteger-:%s",yytext);}
"="|"+"|"-"|"*"|"%"|"&" {printf("\nOperators-:%s",yytext);}
"//".* {printf("\n comments : %s",yytext);}
"/*"(.|\n)*"*/" {printf("\n comments : %s",yytext);}

%%
int yywrap()
{ 
return 1;
}
int main()
{
yyin=fopen("Assign1.c","r");
yylex();
}

