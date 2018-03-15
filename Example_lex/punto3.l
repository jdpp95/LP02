%{
#define NUMBER 400
#define OP 401
%}

%%
[ \t\n]+		;
[0-9]+			|
[0-9]+\.[0-9]+		|
\.[0-9]+		{printf("Number\n");}

['+' | '\-' | '*' | '/'] {printf("Operation\n");}

%%

#include <stdio.h>

main()
{
	yylex();
}
