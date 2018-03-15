#include <stdio.h>
#include <ctype.h>
char *progname;
#define NUMBER 400
#define COMMENT 401
#define TEXT 402
#define COMMAND 403

main(argc,argv)
int argc;

char *argv[];
{
int val;
while (val = lexer())
	printf("value is %d\n",val);
}

lexer()
{
	int c;
	while ((c=getchar()) == ' ' || c == '\t' || c == '\n');
		if (c==EOF)
			return 0;
		if (c == '.'|| isdigit(c)){ /* number*/
			while((c= getchar()) != EOF && isdigit(c));
		if (c == '.')
			while((c = getchar()) != EOF && isdigit(c));
				ungetc(c,stdin);
				return NUMBER;
}

if (c == '#') /* comment*/
{
	int c;	
	int index =1;
	while ((c = getchar ()) != EOF && c != '\n');
		ungetc(c,stdin);
		return COMMENT;
}

if(c == '"') /* literal text*/
{
	int index =1;
	while ((c = getchar()) != EOF && c != '"' && c != '\n');
		ungetc(c,stdin);
		return TEXT;
}

if (isalpha(c)) /* check to see if it is a command*/
{
	int index =1;
	while((c = getchar()) != EOF && isalnum(c));
		ungetc(c,stdin);
		return COMMAND;
}
return c;
}

