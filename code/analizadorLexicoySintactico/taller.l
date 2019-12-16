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
"imprimir"							{return IMPRIMIR;}
"leer"									{return LEER;}
"escribir"							{return IMPRIMIR;}
"salir"									{return EXIT;}
{PREDARIT}   						{yylval.str = yytext; return TKN_PREDARIT;}
{PREDALGE}		 					{yylval.str = yytext; return TKN_PREDALGE;}
{ENTERO}|{REAL}					{yylval.num = atoi(yytext);return TKN_NUMBER;}
":="                    {yylval.str = yytext; return TKN_PUNCTUATION;}
":"                     {yylval.str = yytext; return TKN_PUNCTUATION;}
"="                     {yylval.str = yytext; return TKN_OPEREL;}
"+"                     {yylval.str = yytext; return TKN_OPERARIT;}
"-"                     {yylval.str = yytext; return TKN_OPERARIT;}
"*"                     {yylval.str = yytext; return TKN_OPERARIT;}
"/"                     {yylval.str = yytext; return TKN_OPERARIT;}
";"                     {yylval.str = yytext; return TKN_PUNCTUATION;}
">"                     {yylval.str = yytext; return TKN_OPEREL;}
"<"                     {yylval.str = yytext; return TKN_OPEREL;}
"("                     {yylval.str = yytext; return TKN_PUNCTUATION;}
")"                     {yylval.str = yytext; return TKN_PUNCTUATION;}
"["                     {yylval.str = yytext; return TKN_PUNCTUATION;}
"]"                     {yylval.str = yytext; return TKN_PUNCTUATION;}
"^"											{yylval.str = "&&"; return TKN_LOGICOPER;}
"v"											{yylval.str = "||"; return TKN_LOGICOPER;}
"_"                     {yylval.str = yytext; return TKN_LOGICOPER;}
"V"											{yylval.str = yytext; return TKN_LOGICOPER;}
"E"                     {yylval.str = yytext; return TKN_LOGICOPER;}
"T"                     {yylval.str = yytext; return TKN_LOGICVAL;}
"F"                     {yylval.str = yytext; return TKN_LOGICVAL;}
[ \t\n]+    						;
%%


int yywrap(void)
{
	return 1;
}
