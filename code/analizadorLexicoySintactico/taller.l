%{
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "definiciones.h"
%}
%option nounput yylineno

DIGITO [0-9]
VARARIT [p|q|r|t]
VARALGE [x|y|z]
PREDARIT  {VARARIT}{DIGITO}[1,5]
PREDALGE  {VARALGE}{DIGITO}[1,5]
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
