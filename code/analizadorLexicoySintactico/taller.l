%{
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
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
[ \t\n]+    						;
"imprimir"							{return IMPRIMIR}
"leer"									{return LEER}
"escribir"							{return IMPRIMIR}
"salir"									{return EXIT}
{PREDARIT}   						{return TKN_PREDARIT;}
{PREDALGE}		 					{return TKN_PREDALGE;}
{ENTERO}|{REAL}					{return TKN_NUMBER;}
":"                     {yylval = atoi(yytext); return TKN_PUNCTUATION;}
"="                     {yylval = atoi(yytext); return TKN_OPEREL;}
"+"                     {yylval = atoi(yytext); return TKN_OPERARIT;}
"-"                     {yylval = atoi(yytext); return TKN_OPERARIT;}
"*"                     {yylval = atoi(yytext); return TKN_OPERARIT;}
"/"                     {yylval = atoi(yytext); return TKN_OPERARIT;}
";"                     {yylval = atoi(yytext); return TKN_PUNCTUATION;}
">"                     {yylval = atoi(yytext); return TKN_OPEREL;}
"<"                     {yylval = atoi(yytext); return TKN_OPEREL;}
"("                     {yylval = atoi(yytext); return TKN_PUNCTUATION;}
")"                     {yylval = atoi(yytext); return TKN_PUNCTUATION;}
"["                     {yylval = atoi(yytext); return TKN_PUNCTUATION;}
"]"                     {yylval = atoi(yytext); return TKN_PUNCTUATION;}
"^"											{yylval = atoi(yytext); return TKN_LOGICOPER;}
"v"											{yylval = atoi(yytext); return TKN_LOGICOPER;}
"�"                     {yylval = atoi(yytext); return TKN_LOGICOPER;}
"V"											{yylval = atoi(yytext); return TKN_LOGICVAL;}
"E"                     {yylval = atoi(yytext); return TKN_LOGICVAL;}
"T"                     {yylval = atoi(yytext); return TKN_LOGICVAL;}
"F"                     {yylval = atoi(yytext); return TKN_LOGICVAL;}
%%


int yywrap(void)
{
	return 1;
}
