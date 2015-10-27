/*
  Pascal language lexer specification
*/
   
/* --------------------------Codigo do usuario------------------------ */
   
import java_cup.runtime.*;
      
%%
   
/* -----------------Opcoes e declaracoes----------------- */
  
/* 
   O nome da classe que o jflex vai criar eh PascalLexer
   O codigo serah escrito no arquivo PascalLexer.java 
*/
%class PascalLexer

/*
  O numero da linha atual pode ser acessado atraves da variavel yyline
  e o numero da coluna corrente com a variavel yycolumn.
*/
%line
%column
    
/* 
   Coloca em modo de compatibilidade com o parser gerado pelo CUP.
*/
%cup
   
/*
  Declaracoes
   
  O codigo entre %{ e %}, both of which must be at the beginning of a
  line, serah copiado para o codigo da classe gerada.
  Aqui voce declara variaveis e metodos que sao usados dentro das acoes do scanner.  
*/
%{   
    /* Cria um novo java_cup.runtime.Symbol com informacoes sobre o token corrente. 
    Nesse caso o token nao possui valor. */
    
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    /* Cria um new java_cup.runtime.Symbol com informacoes sobre
       o token corrente, o token possui um valor*/
       
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
    
    public String current_lexeme(){
    	int l = yyline+1;
    	int c = yycolumn+1;
    	return " (line: "+l+" , column: "+c+" , lexeme: '"+yytext()+"')";
  	}
  	
  	public int current_line() {
  		return yyline+1;
  	}
%}
   

/*
  Declaracoes de Macros
  
  Essas declaracoes sao expressoes regulares que serao usadas posteriormente 
  na secao de regras lexicas.  
*/

NQUOTE = [^']

LineTerminator = \r|\n|\r\n

WhiteSpace = {LineTerminator} | [ \t\f]

Identifier = [a-zA-Z_][a-zA-Z_0-9]*

RealNumber = [0-9]+"."[0-9]+

DigSeq = [0-9]+

CharacterString = '({NQUOTE}|'')+' | ''

Comment = "(*" [^*] ~"*)" | "{" [^*] ~"}"

A = [aA]
B = [bB]
C = [cC]
D = [dD]
E = [eE]
F = [fF]
G = [gG]
H = [hH]
I = [iI]
J = [jJ]
K = [kK]
L = [lL]
M = [mM]
N = [nN]
O = [oO]
P = [pP]
Q = [qQ]
R = [rR]
S = [sS]
T = [tT]
U = [uU]
V = [vV]
W = [wW]
X = [xX]
Y = [yY]
Z = [zZ]
   
%%
/* ------------------------Regras Lexicas---------------------- */
   
/*
   Essa secao contem expressoes regulares e acoes, i. e. codigo Java,
   que serah executado quando o scanner  
   This section contains regular expressions and actions, i.e. Java
   code, that will be executed when the scanner casar com a expressao
   regular associada. */
   
   /* YYINITIAL is the state at which the lexer begins scanning.  So
   these regular expressions will only be matched if the scanner is in
   the start state YYINITIAL. */
   
<YYINITIAL> {

	/* palavras chave pascal padrao */
	{A}{N}{D}			                   		 { return symbol(sym.AND, yytext()); }
	{A}{R}{R}{A}{Y}                        		 { return symbol(sym.ARRAY); }
	{B}{E}{G}{I}{N}		                   		 { return symbol(sym.BEGIN); }
	{C}{A}{S}{E}                           		 { return symbol(sym.CASE); }
	{C}{O}{N}{S}{T}                        		 { return symbol(sym.CONST); }
	{D}{I}{V}                              		 { return symbol(sym.DIV, yytext()); }
	{D}{O}                                 		 { return symbol(sym.DO); }
	{D}{O}{W}{N}{T}{O}                     		 { return symbol(sym.DOWNTO); }
	{E}{L}{S}{E}                           		 { return symbol(sym.ELSE); }
	{E}{N}{D}                              		 { return symbol(sym.END); }
	{F}{I}{L}{E}                           		 { return symbol(sym.FILE); }
	{F}{O}{R}                              		 { return symbol(sym.FOR); }
	{F}{O}{R}{W}{A}{R}{D}                        { return symbol(sym.FORWARD); }
	{F}{U}{N}{C}{T}{I}{O}{N}                     { return symbol(sym.FUNCTION); }
	{G}{O}{T}{O}                                 { return symbol(sym.GOTO); }
	{I}{F}                                       { return symbol(sym.IF); }
	{I}{M}{P}{L}{E}{M}{E}{N}{T}{A}{T}{I}{O}{N}   { return symbol(sym.IMPLEMENTATION); }
	{I}{N}                                       { return symbol(sym.IN); }
	{I}{N}{T}{E}{R}{F}{A}{C}{E}                  { return symbol(sym.INTERFACE); }
	{L}{A}{B}{E}{L}                 			 { return symbol(sym.LABEL); }
	{M}{O}{D}                                    { return symbol(sym.MOD, yytext()); }
	{N}{I}{L}                                    { return symbol(sym.NIL); }
	{N}{O}{T}                                    { return symbol(sym.NOT, yytext()); }
	{O}{F}                                       { return symbol(sym.OF); }
	{O}{R}                                       { return symbol(sym.OR, yytext()); }
	{P}{A}{C}{K}{E}{D}                           { return symbol(sym.PACKED); }
	{P}{R}{O}{C}{E}{D}{U}{R}{E}                  { return symbol(sym.PROCEDURE); }
	{P}{R}{O}{G}{R}{A}{M}                        { return symbol(sym.PROGRAM); }
	{R}{E}{C}{O}{R}{D}                           { return symbol(sym.RECORD); }
	{R}{E}{P}{E}{A}{T}                           { return symbol(sym.REPEAT); }
	{S}{E}{T}                                    { return symbol(sym.SET); }
	{T}{H}{E}{N}                                 { return symbol(sym.THEN); }
	{T}{O}                                       { return symbol(sym.TO); }
	{T}{Y}{P}{E}                                 { return symbol(sym.TYPE); }
	{U}{N}{I}{T}                                 { return symbol(sym.UNIT); }
	{U}{N}{T}{I}{L}                              { return symbol(sym.UNTIL); }
	{U}{S}{E}{S}                                 { return symbol(sym.USES); }
	{V}{A}{R}                                    { return symbol(sym.VAR); }
	{W}{H}{I}{L}{E}                              { return symbol(sym.WHILE); }
	{W}{I}{T}{H}                                 { return symbol(sym.WITH); }
	{X}{O}{R}                                    { return symbol(sym.XOR); }
	{E}{X}{T}{E}{R}{N}{A}{L}                     { return symbol(sym.EXTERNAL); }
	
	/* tipos pre-definidos */
	{I}{N}{T}{E}{G}{E}{R}                        { return symbol(sym.INTEGER); }
	{B}{O}{O}{L}{E}{A}{N}                        { return symbol(sym.BOOLEAN); }
	{R}{E}{A}{L}                                 { return symbol(sym.REAL); }
	{S}{T}{R}{I}{N}{G}                           { return symbol(sym.STRING); }
	{C}{H}{A}{R}                                 { return symbol(sym.CHAR); }
	{T}{R}{U}{E}                                 { return symbol(sym.TRUE); }
	{F}{A}{L}{S}{E}                              { return symbol(sym.FALSE); }
	
	
	/* separadores */
    ";"                { return symbol(sym.SEMICOLON); }
    "."                { return symbol(sym.DOT); }
    ":="               { return symbol(sym.ASSIGNMENT); }
	":"                { return symbol(sym.COLON); }
	","                { return symbol(sym.COMMA); }
	".."               { return symbol(sym.DOTDOT); }
	"="                { return symbol(sym.EQUAL); }
	">="               { return symbol(sym.GE); }
	">"                { return symbol(sym.GT); }
	"["                { return symbol(sym.LBRAC); }
	"<="               { return symbol(sym.LE); }
	"("                { return symbol(sym.LPAREN); }
	"<"                { return symbol(sym.LT); }
	"-"                { return symbol(sym.MINUS, yytext()); }
	"<>"               { return symbol(sym.NOTEQUAL); }
	"+"                { return symbol(sym.PLUS, yytext()); }
	"]"                { return symbol(sym.RBRAC); }
	")"                { return symbol(sym.RPAREN); }
	"/"                { return symbol(sym.SLASH, yytext()); }
	"*"                { return symbol(sym.STAR, yytext()); }
	"**"               { return symbol(sym.STARSTAR); }
	"->"               { return symbol(sym.UPARROW); }
	"^"                { return symbol(sym.UPARROW); }
	
	"{"				   {}
	"}"                {}
	
	{CharacterString}  { return symbol(sym.CHARACTER_STRING, yytext()); }
    
    {DigSeq}           { return symbol(sym.DIGSEQ, yytext()); }
    
    {RealNumber}       { return symbol(sym.REALNUMBER, yytext()); }
    
    {Identifier}       { return symbol(sym.IDENTIFIER, yytext()); }
    
    {WhiteSpace}       { /* faz nada */ }   
    
    {Comment}          {}
}


/* No token was found for the input so through an error.  Print out an
   Illegal character message with the illegal character that was found. */
   
[^]                    { throw new Error("Illegal character <"+yytext()+">"); }
