%{
void yyerror(char *s);
int yylex();
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
int values[52];
char *identifiers[52];
int symbolVal(char *symbol);
void updateSymbolVal(char *symbol, int val);
int idOfPred(char *pred);
%}

%union {char *str; int num;}
%token IMPRIMIR
%token ESCRIBIR
%token LEER
%token EXIT
%token NULLTOKEN
%token <str> TKN_PREDARIT
%token <str> TKN_PREDALGE
%token <num> TKN_NUMBER
%token TKN_PUNCTUATION
%token TKN_OPEREL
%token TKN_OPERARIT
%token <str> TKN_LOGICOPER
%token <num> TKN_LOGICVAL
%token <str> TKN_VARINT
%type <num> LINE EXP TERM
%type <str> ASSIGNMENT
%%

/* descriptions of expected inputs     corresponding actions (in C) */

LINE : ASSIGNMENT ';'		{;}
		| EXIT ';'		{exit(EXIT_SUCCESS);}
		| IMPRIMIR EXP ';'			{printf("Printing %d\n", $2);}
		| LINE ASSIGNMENT ';'	{;}
		| LINE IMPRIMIR EXP ';'	{printf("Printing %d\n", $3);}
		| LINE EXIT ';'	{exit(EXIT_SUCCESS);}
        ;

ASSIGNMENT : TKN_PREDARIT ':' EXP  { updateSymbolVal($1,$3); }
					|	 TKN_PREDARIT '=' EXP  { updateSymbolVal($1,$3); }
					;

EXP    	: TERM	{$$ = $1;}
       	| EXP 'v' TERM	{$$ = $1 || $3;}
				| EXP '^' TERM	{$$ = $1 && $3;}
       	;

TERM   	: TKN_LOGICVAL                {$$ = $1;}
				| TKN_PREDARIT			{$$ = symbolVal($1);}
				| TKN_PREDALGE			{$$ = symbolVal($1);}
        ;

%%                     /* C code */
/* returns the value of a given symbol */

int idOfPred(char *pred)
{
	for(int j = 0; j < 52; j++)
	{
		char *m = identifiers[j];
		if( strcmp(m, pred) != 0 )
		{
			return j;
		}else
		 {
			 return 0;
		 }
	}

}

int symbolVal(char *symbol)
{
	int id = idOfPred(symbol);
	return values[id];
}

/* updates the value of a given symbol */
void updateSymbolVal(char *symbol, int val)
{
	int id = idOfPred(symbol);
	values[id] = val;
}

int main (void) {
	/* init symbol table */
	int idx = -1;
	int i;
	for(i=0; i<52; i++)
	{
		values[i] = 0;
		identifiers[i] = "a";
		printf("Id: %s, Val: %s\n", identifiers[i], values[i]?"true":"false");
	}

	return yyparse( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);}
