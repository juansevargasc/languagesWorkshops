#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "definiciones.h"

extern int yylex();
extern int yylineno;
extern char* yytext; /*String equiv.*/
extern int yylval;

char *names[] = {NULL, "TKN_PREDARIT", "TKN_PREDALGE", "TKN_NUMBER",
	"TKN_PUNCTUATION", "TKN_OPEREL", "TKN_OPERARIT", "TKN_LOGICOPER", "TKN_LOGICVAL",
	,"TKN_VARINT"};

int main(void)
{

	int ntoken, vtoken;
	ntoken = yylex();

	while(ntoken)
 	{
		//printf("TOKEN IS: %d\n", ntoken);
		//vtoken = yylex();
		switch (ntoken)
		{
			case TKN_PREDARIT:
			case TKN_PREDALGE:
			case TKN_NUMBER:
			case TKN_PUNCTUATION:
			case TKN_OPEREL:
			case TKN_OPERARIT:
			case TKN_LOGICOPER:
			case TKN_LOGICVAL:
			case TKN_VARINT:
				printf("Token number: %d, Token name: %s, Lexeme: %s\n", ntoken, names[ntoken], yytext);
				break;
			default:
				printf("Syntax error in line %d, Lexeme: '%s' not recognized\n", yylineno, yytext);

		}
		ntoken = yylex();
	}

	return 0;
}
