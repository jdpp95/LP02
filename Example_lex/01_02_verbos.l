%{
/*
* Este ejemplo demuestra un reconocimiento simple:
*un verbo / o no verbo
*/

%}
%% 

[\t]+  /* ignora el espacio en blanco*/;

is |
am |
are |
were |
was |
be |
being |
been |
do |
does |
did |
will |
would |
should |
can |
could |
has |
have |
had |
go	{printf("%s: is a verb\n*",yytext);  
}

[a-zA-Z]+ { printf("%s: is not a verb\n",yytext);


}
.|\n	{ ECHO; /*normal default anyway */
}
%%
main()
{
	yylex();
}
