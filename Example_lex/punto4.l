%{
#define NUMBER 258
#define ADD 259
#define SUB 260
#define MUL 261
#define DIV 262
#define ABS 263
#define EOL 264
%}

%%
[ \t]+		;

["\n"] {printf("%d = %s\n",EOL,yytext);}

["\|"][0-9]+["\|"]			|
["\|"][0-9]+\.[0-9]+["\|"]		|
["\|"]\.[0-9]+["\|"]		{printf("%d = %s\n",ABS,yytext); return ABS;}

[0-9]+			|
[0-9]+\.[0-9]+		|
\.[0-9]+		{printf("%d = %s\n",NUMBER,yytext); return NUMBER;}

['+'] {printf("%d = %s\n",ADD,yytext);}

['\-'] {printf("%d = %s\n",SUB,yytext);}

['*'] {printf("%d = %s\n",MUL,yytext);}

['/'] {printf("%d = %s\n",DIV,yytext);}

["\|"] {printf("%d = %s\n",ABS,yytext);}

%%

#include <stdio.h>

main()
{
	yylex();
}
