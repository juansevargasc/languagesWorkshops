%{
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}
%option nounput yylineno

DIGITO [0-9]
VARARIT [p|q|r|t]
VARALGE [x|y|z]
PREDARIT  {VARARIT}({DIGITO}{0,5})
PREDALGE  {VARALGE}({DIGITO}{0,5})
ENTERO  [0-9]+
REAL  [0-9]+\.[0-9]+

%%
[ \t\n]+    						;
"imprimir"							{return IMPRIMIR;}
"leer"									{return LEER;}
"escribir"							{return IMPRIMIR;}
"salir"									{return EXIT;}
{PREDARIT}   						{return TKN_PREDARIT;}
{PREDALGE}		 					{return TKN_PREDALGE;}
{ENTERO}|{REAL}					{return TKN_NUMBER;}
":"                     {yylval = yytext; return TKN_PUNCTUATION;}
"="                     {yylval = yytext; return TKN_OPEREL;}
"+"                     {yylval = yytext; return TKN_OPERARIT;}
"-"                     {yylval = yytext; return TKN_OPERARIT;}
"*"                     {yylval = yytext; return TKN_OPERARIT;}
"/"                     {yylval = yytext; return TKN_OPERARIT;}
";"                     {yylval = yytext; return TKN_PUNCTUATION;}
">"                     {yylval = yytext; return TKN_OPEREL;}
"<"                     {yylval = yytext; return TKN_OPEREL;}
"("                     {yylval = yytext; return TKN_PUNCTUATION;}
")"                     {yylval = yytext; return TKN_PUNCTUATION;}
"["                     {yylval = yytext; return TKN_PUNCTUATION;}
"]"                     {yylval = yytext; return TKN_PUNCTUATION;}
"^"											{yylval = '&'; return TKN_LOGICOPER;}
"v"											{yylval = '|'; return TKN_LOGICOPER;}
"�"                     {yylval = yytext; return TKN_LOGICOPER;}
"V"											{yylval = yytext); return TKN_LOGICOPER;}
"E"                     {yylval = yytext; return TKN_LOGICOPER;}
"T"                     {yylval = yytext; return TKN_LOGICVAL;}
"F"                     {yylval = yytext; return TKN_LOGICVAL;}
%%


int yywrap(void)
{
	return 1;
}
