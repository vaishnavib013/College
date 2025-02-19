%{
#include<stdio.h>
int lc=0,cc=0,wc=0,sp=0,tb=0;
%}
%%
\n {lc++;cc=cc+yyleng;}
" " {sp++;cc=cc+yyleng;}
\t {tb++;cc=cc+yyleng;}
[A-Za-z0-9] {wc++;cc=cc+yyleng;}
%%
int yywrap()
{
	return 1;
}
int main()
{
yyin=fopen("Assign1.c","r");
yylex();
printf("The count of Word is:%d",wc);
printf("\nThe count of line is :%d",lc);
printf("\nThe count of Character is:%d",cc);
printf("\nThe count of Tabs is:%d",tb);
printf("\nThe count of Spaces is :%d",sp);
}
