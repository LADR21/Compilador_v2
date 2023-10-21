%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "Semantico.tab.h"

    FILE *yyin;
%}

%option noyywrap
%option yylineno

DIGITO [0-9]
LETRA [a-zA-Z]
COMA (",")
PUNCOM (";")
TWPUN (":")
PUNT (".")
GUION ("_")


IDENT ({LETRA}{LETRA}|{DIGITO}{GUION})*
CONS_ENTERO ((-?[1-9][0-9]*)|0)
CONS_FLOTANTE {DIGITO}+\.{DIGITO}+
CADENA \"[^\n]*\"

CIWHILE ("while"|"do")

TIPDATA ("int"|"float"|"string"|"char"|"double")
OP_REL ("<"|">"|"<="|">="|"==")
IGUAL ("=")
OP_MAT ("+"|"-"|"*"|"/")
ENTRADA ("print")
LECTURA ("write"|"Return")
PREGUNTA ("if"|"else"|"else if")


KEYOP ("{")
KEYCLO ("}")

%%

{DIGITO}   {yylval.num=atoi(yytext); return DIGITO;}
{LETRA}    {sscanf (yytext,"%s",yylval.nombre); return LETRA;}
{COMA}     {sscanf (yytext,"%s",yylval.nombre); return COMA;}
{PUNCOM}   {sscanf (yytext,"%s",yylval.nombre); return PUNCOM;}
{TWPUN}    {sscanf (yytext,"%s",yylval.nombre); return TWPUN;}
{PUNT}     {sscanf (yytext,"%s",yylval.nombre); return PUNT;}
{GUION}    {sscanf (yytext,"%s",yylval.nombre); return GUION;}

{IDENT}    {sscanf (yytext,"%s",yylval.nombre); return IDENT;}
{CONS_ENTERO}   {sscanf (yytext,"%s",yylval.nombre); return CONS_ENTERO;}
{CONS_FLOTANTE} {sscanf (yytext,"%s",yylval.nombre); return CONS_FLOTANTE;}
{CADENA}   {sscanf (yytext,"%s", yylval.nombre); return CADENA;}

{CIWHILE}  {sscanf (yytext,"%s", yylval.nombre); return CIWHILE;}

{TIPDATA}  {sscanf (yytext,"%s", yylval.nombre); return TIPDATA;}
{OP_REL}   {sscanf (yytext,"%s", yylval.nombre); return OP_REL;}
{IGUAL}    {sscanf (yytext,"%s", yylval.nombre); return IGUAL;}
{OP_MAT}   {sscanf (yytext,"%s", yylval.nombre); return OP_MAT;}
{ENTRADA}  {sscanf (yytext,"%s", yylval.nombre); return ENTRADA;} 
{LECTURA}  {sscanf (yytext,"%s", yylval.nombre); return LECTURA;}
{PREGUNTA} {sscanf (yytext,"%s", yylval.nombre); return PREGUNTA;}


{KEYOP} {sscanf (yytext,"%s", yylval.nombre); return KEYOP;} 
{KEYCLO} {sscanf (yytext,"%s", yylval.nombre); return KEYCLO;}


%%

