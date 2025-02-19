%{
#include <stdio.h>
#include <stdlib.h>
int lc;
int wc;
int tc;
int cc;
int sc;
%}

%%
[\n] {lc++;cc=cc+yyleng;}
[ ] {sc++;cc=cc+yyleng;}
[^ \t\n]+ {wc++;cc=cc+yyleng;}
[\t] {tc++;cc=cc+yyleng;}
%%

int main(){
	yyin=fopen("ass2.txt","r");
	yylex();
	printf("  OUTPUT   \n");
	printf("Word Count : %d\n",wc);
	printf("Line Count : %d\n",lc);
	printf("Space Count : %d\n",sc);
	printf("Tab Count : %d\n",tc);
	printf("Character Count : %d\n",cc);
	return 0;
}

int yywrap()
{
      return 1;
}

