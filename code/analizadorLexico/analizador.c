#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define TKN_PREDARIT 1  /* Token definido para los predicados aritm�ticos */
#define TKN_PREDALGE 2  /* Token definido para los predicados algebraicos */
#define TKN_NUMBER 3    /* Token definido para n�meros */
#define TKN_PUNCTUATION 4  /* Token definido para los signos de puntuaci�n */
#define TKN_OPEREL 5    /* Token definido para los operadores relacionales */
#define TKN_OPERARIT 6    /* Token definido para los operadores aritm�ticos */
#define TKN_LOGICOPER 7   /* Token definido para los operadores l�gicos */
#define TKN_LOGICVAL 8

extern int yylex();
extern int yylineno;
extern char* yytext; /*String equiv.*/
extern int yylval;

char *names[] = {NULL, "TKN_PREDARIT", "TKN_PREDALGE", "TKN_NUMBER",
	"TKN_PUNCTUATION", "TKN_OPEREL", "TKN_OPERARIT", "TKN_LOGICOPER", "TKN_LOGICVAL", "OP_PLUS", "OP_MINUS",
	"OP_MULT", "OP_DIV", "OP_EQUALS", "OP_COLON", "OP_SEMICOLON", "OP_MORETHAN", "OP_LESSTHAN", "OPEN_PARENTH",
	"CLOSE_PARENTH", "OPEN_SQUAREB", "CLOSE_SQUAREB", "OP_AND", "OP_OR", "OP_FORALL", "OP_EXIST", "OP_TRUE", "OP_FALSE"};

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
				printf("Token number: %d, Token name: %s, Lexeme: %s\n", ntoken, names[ntoken], yytext);
				break;
			default:
				printf("Syntax error in line %d, Lexeme: '%s' not recognized\n", yylineno, yytext);

		}
		ntoken = yylex();
	}

	return 0;
}
