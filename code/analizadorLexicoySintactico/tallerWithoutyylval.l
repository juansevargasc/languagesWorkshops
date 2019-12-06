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
PREDARIT  {VARARIT}{DIGITO}*
PREDALGE  {VARALGE}{DIGITO}*
ENTERO  [0-9]+
REAL  [0-9]+\.[0-9]+

%%
[ \t\n]+    ;
{PREDARIT}   return TKN_PREDARIT;
{PREDALGE}		 return TKN_PREDALGE;
{ENTERO}|{REAL}		return TKN_NUMBER;
":"                     {return TKN_PUNCTUATION;}
"="                     {return TKN_OPEREL;}
"+"                     {return TKN_OPERARIT;}
"-"                     {return TKN_OPERARIT;}
"*"                     {return TKN_OPERARIT;}
"/"                     {return TKN_OPERARIT;}
";"                     {return TKN_PUNCTUATION;}
">"                     {return TKN_OPEREL;}
"<"                     {return TKN_OPEREL;}
"("                     {return TKN_PUNCTUATION;}
")"                     {return TKN_PUNCTUATION;}
"["                     {return TKN_PUNCTUATION;}
"]"                     {return TKN_PUNCTUATION;}
"^"			{return TKN_LOGICOPER;}
"v"			{return TKN_LOGICOPER;}
"�"                     {return TKN_LOGICOPER;}
"V"			{return TKN_LOGICVAL;}
"E"                     {return TKN_LOGICVAL;}
"T"                     {return TKN_LOGICVAL;}
"F"                     {return TKN_LOGICVAL;}
.						return NULLTOKEN;
%%


int yywrap(void)
{
	return 1;
}
