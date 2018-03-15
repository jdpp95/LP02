%{

%}
%% 

[\t]+  /* ignora el espacio en blanco*/;

dog	{printf("Perro\n");
}

cat	{printf("Gato\n");
}

compiler	{printf("Compilador\n");
}

computer	{printf("Computador\n");
}

mail	{printf("Correo\n");
}

phone	{printf("Telefono\n");
}

door	{printf("Puerta\n");
}

any	{printf("Cualquiera\n");
}

key	{printf("Tecla\n");
}

book	{printf("Libro\n");
}

[a-zA-Z]+ { printf("No se que significa\n",yytext);


}
.|\n	{ ECHO; /*normal default anyway */
}
%%
main()
{
	yylex();
}
