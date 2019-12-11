%{
void yyerror(char *s);
int yylex();
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
bool symbols[52]; /*First change*/
bool symbolVal(char[] symbol);
void updateSymbolVal(char[] symbol, bool val);
%}


%union {int num; char id;} /* Yacc definitions */ /*Return types of yacc, equivalent of union in C*/
%start line		/*Starting production*/
%token IMPRIMIR	/*Tokens from lex*/
%token ESCRIBIR
%token LEER
%token EXIT
%token NULLTOKEN
%token TKN_PREDARIT
%token TKN_PREDALGE
%token TKN_NUMBER
%token TKN_PUNCTUATION
%token TKN_OPEREL
%token TKN_OPERARIT
%token TKN_LOGICOPER
%token TKN_LOGICVAL
%token TKN_VARINT
%type <num> line exp term /*Types of yacc definitions defined for union, terminals*/
%type <id> assignment /**/

%%

/* descriptions of expected inputs     corresponding actions (in C) */

line : assignment ';'		{;}
		| exit_command ';'		{exit(EXIT_SUCCESS);}
		| imprimir exp ';'			{printf("Printing %d\n", $2);}
		| line assignment ';'	{;}
		| line print exp ';'	{printf("Printing %d\n", $3);}
		| line exit_command ';'	{exit(EXIT_SUCCESS);}
        ;

assignment : identifier '=' exp  { updateSymbolVal($1,$3); }
			;
exp    	: term                  {$$ = $1;}
       	| exp '+' term          {$$ = $1 + $3;}
       	| exp '-' term          {$$ = $1 - $3;}
       	;
term   	: number                {$$ = $1;}
		| identifier			{$$ = symbolVal($1);}
        ;

%%                     /* C code */

int computeSymbolIndex(char token)
{
	int idx = -1;
	if(islower(token)) {
		idx = token - 'a' + 26;
	} else if(isupper(token)) {
		idx = token - 'A';
	}
	return idx;
}

/* returns the value of a given symbol */
int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}

/* updates the value of a given symbol */
void updateSymbolVal(char symbol, int val)
{
	int bucket = computeSymbolIndex(symbol);
	symbols[bucket] = val;
}

int main (void) {
	/* init symbol table */
	int i;
	for(i=0; i<52; i++) {
		symbols[i] = 0;
	}

	return yyparse ( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);}
