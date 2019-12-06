%{
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#define TKN_PREDARIT 1  /* Token definido para los predicados aritm�ticos */
#define TKN_PREDALGE 2  /* Token definido para los predicados algebraicos */
#define TKN_NUMBER 3    /* Token definido para n�meros */
#define TKN_PUNCTUATION 4  /* Token definido para los signos de puntuaci�n */
#define TKN_OPEREL 5    /* Token definido para los operadores relacionales */
#define TKN_OPERARIT 6    /* Token definido para los operadores aritm�ticos */
#define TKN_LOGICOPER 7   /* Token definido para los operadores l�gicos */
#define TKN_LOGICVAL 8   /* Token definido para los valores de verdad */
#define OP_PLUS 9
#define OP_MINUS 10
#define OP_MULT 11
#define OP_DIV 12
#define OP_EQUALS 13
#define OP_COLON 14
#define OP_SEMICOLON 15
#define OP_MORETHAN 16
#define OP_LESSTHAN 17
#define OPEN_PARENTH 18
#define CLOSE_PARENTH 19
#define OPEN_SQUAREB 20
#define CLOSE_SQUAREB 21
#define OP_AND 22
#define OP_OR 23
#define OP_FORALL 24
#define OP_EXIST 25
#define OP_TRUE 26
#define OP_FALSE 27
%}
%option nounput yylineno

DIGITO [0-9]
VARARIT [p|q|r|t]
VARALGE [x|y|z]
PREDARIT  {VARARIT}{DIGITO}*
PREDALGE  {VARALGE}{DIGITO}*
ENTERO  [0-9]+
REAL  [0-9]+\.[0-9]+

%%
[ \t\n]+    ;
{PREDARIT}   return TKN_PREDARIT;
{PREDALGE}		 return TKN_PREDALGE;
{ENTERO}|{REAL}		return TKN_NUMBER;
":"                     {yylval = OP_COLON; return TKN_PUNCTUATION;}
"="                     {yylval = OP_EQUALS; return TKN_OPEREL;}
"+"                     {yylval = OP_PLUS; return TKN_OPERARIT;}
"-"                     {yylval = OP_MINUS; return TKN_OPERARIT;}
"*"                     {yylval = OP_MULT; return TKN_OPERARIT;}
"/"                     {yylval = OP_DIV; return TKN_OPERARIT;}
";"                     {yylval = OP_SEMICOLON; return TKN_PUNCTUATION;}
">"                     {yylval = OP_MORETHAN; return TKN_OPEREL;}
"<"                     {yylval = OP_LESSTHAN; return TKN_OPEREL;}
"("                     {yylval = OPEN_PARENTH; return TKN_PUNCTUATION;}
")"                     {yylval = CLOSE_PARENTH; return TKN_PUNCTUATION;}
"["                     {yylval = OPEN_SQUAREB; return TKN_PUNCTUATION;}
"]"                     {yylval = CLOSE_SQUAREB; return TKN_PUNCTUATION;}
"^"			{yylval = OP_AND; return TKN_LOGICOPER;}
"v"			{yylval = OP_OR; return TKN_LOGICOPER;}
"�"                     {yylval = OP_COLON; return TKN_LOGICOPER;}
"V"			{yylval = OP_FORALL; return TKN_LOGICVAL;}
"E"                     {yylval = OP_EXIST; return TKN_LOGICVAL;}
"T"                     {yylval = OP_TRUE; return TKN_LOGICVAL;}
"F"                     {yylval = OP_FALSE; return TKN_LOGICVAL;}
%%


int yywrap(void)
{
	return 1;
}
