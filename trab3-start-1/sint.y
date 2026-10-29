%{ 
#include "analex.c" 
%}

%token NUM 
%token ID 
%token INT
%token IF 
%token ELSE
%token WHILE
%token GE
%token DO
%token VOID
%token CHAR
%token STR
%token NE
%token EQ
%token LE 
%token NOT
%token FOR 
%token FLOAT
%token DOUBLE
%token LONG 
%token SHORT
%token UNSIGNED
%token OR
%token AND
%token ENDIF
%token RETURN 



%left '+' '-'
%left '*' '/'
%right '='
%left '>' '<' LE GE 
%nonassoc EQ NE
%left OR AND 
%right NOT





%start S 
%%



S : P {printf("Sem erros sintáticos\n");}
	;
P :	ListaFuncoesGeral
	;

ListaFuncoesGeral : Funcoes ListaFuncoesGeral
		|Funcoes
		;

Funcoes : SintaxeFunc ';'
		|Func
		;

SintaxeFunc : TipoEspecial ID '('ListaParametrosSintaxe ')' 
	|TipoEspecial ID '('')' 
	|VOID ID '('ListaParametrosSintaxe ')'
	|VOID ID '('')'
	;	

Func : SintaxeFunc'{'ListaComandos'}'
	;


ListaParametros : Parametro ',' ListaParametros
	|Parametro
	;

ListaParametrosSintaxe : TipoEspecial ParametroDec ',' ListaParametrosSintaxe
	|TipoEspecial ParametroDec
	;


ParametroDec: ID
	|ID'['Expressao ']' 
	;

Parametro : Expressao
		|STR
		;

ChamadaFunc : ID '(' ListaParametros ')'
		|ID '('')'
		;

ListaComandos : Comando ListaComandos
		|Comando 
		;
		
Comando : Variaveis ';'
		|ChamadaFunc ';'
		|Atribuicao ';'
		|RETURN Expressao ';'
		|Condicional
		|Loop
		;

Variaveis : TipoEspecial Declaracao
		;



Declaracao : ID ',' Declaracao
		|ID 
		|ID'['Expressao ']'
		|ID'['Expressao ']' ',' Declaracao
		|Atribuicao ',' Declaracao
		|Atribuicao
		;
		
Tipo :   INT
		|FLOAT
		|CHAR
		|DOUBLE
		;

TipoEspecial : SHORT Tipo
		|LONG Tipo
		|UNSIGNED Tipo
		|Tipo
		;
		
Expressao : Expressao '+' Expressao
		| Expressao '-' Expressao
		|Expressao '*' Expressao
		|Expressao '/' Expressao
		|Expressao '>' Expressao
		|Expressao '<' Expressao
		|Expressao GE  Expressao
		|Expressao LE Expressao
		|Expressao NE Expressao
		|Expressao EQ Expressao
		|Expressao OR Expressao
		|Expressao AND Expressao
		|'('Expressao')'
		|NOT Expressao
		|NUM
		|ID
		|ID'['Expressao ']'
		|ChamadaFunc
		;

Atribuicao : ID '=' Expressao
		|ID'['Expressao ']' '=' Expressao
		;
		


Condicional : IF'('Expressao')''{'ListaComandos'}' ENDIF
		|IF'('Expressao')''{'ListaComandos'}' ELSE'{'ListaComandos'}' ENDIF
		|IF'('Expressao')' Comando ENDIF
		|IF'('Expressao')' Comando ELSE Comando ENDIF
		|IF'('Expressao')''{'ListaComandos'}' ELSE Comando ENDIF
		|IF'('Expressao')' Comando ELSE '{'ListaComandos'}' ENDIF
		;
		
AtribFOR : TipoEspecial ListaAtribuicao
		|ListaAtribuicao
		;

ListaAtribuicao : Atribuicao ',' ListaAtribuicao
		|Atribuicao
		;

Loop : WHILE'('Expressao')''{'ListaComandos'}'
		|FOR'('AtribFOR';'Expressao';'ListaAtribuicao')''{'ListaComandos'}'
		|DO'{'ListaComandos'}'WHILE'('Expressao')'';'
		;


		



%%  
void main(int argc, char **argv) {     
  yyin = fopen(argv[1],"r");
  yyparse();      
} 
