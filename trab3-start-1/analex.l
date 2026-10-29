%{
#include <stdio.h>
#include "sint.h"
// #include "tokens.h"
#include "tabsimb.h"
int linha = 1;
int yyerror(char *s) { 
  printf("%s na linha %d\n",s,linha); 
}
%}
dig [0-9]
letra [a-zA-Z_]
str \"[^\"]*\"
%%
"int"  {return INT;}
"float" {return FLOAT;}
"double" {return DOUBLE;}
"short" {return SHORT;}
"long" {return LONG;}
"unsigned" {return UNSIGNED;}
"void"  {return VOID;}
"char"  {return CHAR;}
{str} {return STR;} 
"if"	{return IF;}	
"else" {return ELSE;}
"while" {return WHILE;}
"do"	{ return DO; }
"for"	{ return FOR; }
">"   {return '>';}
"<"   {return '<';}
">="	{return GE;} 
"<="	{return LE;}	
"!="	{return NE;}
"!"	{return NOT;}
"=="	{return EQ;}
"||"	{return OR;}
"&&"	{return AND;}
"endif"	{return ENDIF;}
"return"  {return RETURN;}
"("	{return '(';}
")"	{return ')';}
"{"	{return '{';}
"}"	{return '}';}
"["	{return '[';}
"]"	{return ']';}
";"	{return ';';}
"="	{return '=';}
","	{return ',';}
"+"	{return '+';}
"-"	{return '-';}
"*"	{return '*';}
"/"	{return '/';}	
{dig}+("."{dig}+)?	{ yylval = atoi(yytext); return NUM;}
{letra}({letra}|{dig})*  { insere(yytext);
                           return ID;}  
[ \t\r] {}
\n	{ linha++; }
.	{printf("erro lexico na linha %d - %s\n",
             linha, yytext); }
%%
#ifndef yywrap
int yywrap() { return 1; }
#endif

