%{
#define NUMBER 400
#define COMMENT 401
#define TEXT 402
#define COMMAND 403
%}

%%
[ \t\n]+		;
[0-9]+			|
[0-9]+\.[0-9]+		|
\.[0-9]+		{return NUMBER;}
\#[a-zA-Z][a-zA-Z0-9]*	{return COMMENT;}
\"[^\"\n]*\"		{return TEXT;}
[a-zA-Z][a-zA-Z0-9]+	{return COMMAND;}

%%

#include <stdio.h>

main(argc,argv)
int argc;
char *argv[];
{
int val;
while(val = yylex()) printf("value is %d\n",val);
}




