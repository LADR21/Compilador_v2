%{
#include <stdio.h>
#include <string.h>
extern FILE *yyin;
int yyerror(const char *s);
int yylex();
extern int yyparse();
extern int yylineno;
extern char *yytext;
%}

%union{
    int num;
    char nombre[10];
}

%token<nombre> DIGITO ESPACIO LETRA COMA PUNCOM TWPUN PUNT GUION IDENT CADENA CIWHILE TIPDATA OP_REL IGUAL OP_MAT ENTRADA LECTURA PREGUNTA KEYOP KEYCLO
%token<num> CONS_ENTERO CONS_FLOTANTE



%%
    Start: program;

    program: INSTRUCT;

    INSTRUCT: | DVAR | PREGUNTON | LEER |ESCRIBIR | CICLO ;

    INSTRUC: INSTRUCT;

    IDN: CONS_ENTERO | CONS_FLOTANTE ;
    ID: IDENT | IDN ;

    DVAR : TIPDATA ID PUNCOM INSTRUC | TIPDATA ID VAR;

    VAR: | IGUAL IDN PUNCOM INSTRUCT| IGUAL OPERACIONES INSTRUCT;   
    
    PREGUNTON: PREGUNTA ID OP_REL ID KEYOP INSTRUCT KEYCLO INSTRUC;

    

    OPERACIONES: ID TWPUN IDN OP_MAT IDN;

    LEER: LECTURA ID TWPUN INSTRUC;

    ESCRIBIR: ENTRADA ID TWPUN INSTRUC;

    CICLO: CIWHILE ID OP_REL ID KEYOP INSTRUCT KEYCLO | CIWHILE KEYOP INSTRUCT KEYCLO CIWHILE ID OP_REL ID INSTRUC;
%%

int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Uso: %s archivo_fuente\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
        printf("No se pudo abrir el archivo.\n");
        return 1;
    }

    yyparse();

    fclose(yyin);
    printf("\nAnálisis de Código Terminado.\n");
    return 0;
}

int yyerror(const char *s) {
    printf("ESTO ES UN ERROR EN LA LINEA %d y es %s \n", yylineno, yytext);
    return 0;
}

