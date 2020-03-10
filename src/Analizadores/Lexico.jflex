/*------------  1ra Area: Codigo de Usuario ---------*/
//------> Paquetes,importaciones
package Analizadores;
import java_cup.runtime.*;
import java.util.LinkedList;

/*------------  2da Area: Opciones y Declaraciones ---------*/
%%
%{
    //----> Codigo de usuario en sintaxis java
%}

//-------> Directivas
%public 
%class Lexico
%cupsym Simbolos
%cup
%char
%column
%full
%ignorecase
%line
%unicode

%init{ 
    yyline = 1; 
    yychar = 1; 
%init} 

//------> Expresiones Regulares
BLANCOS=[ \r\t]+
CADENACOMILLASDOBLES = [\"]([^\"\n]|(\\\"))*[\"]
D=[0-9]+
DD=[0-9]+("."[  |0-9]+)?
ID=[A-Za-z]+["_"0-9A-Za-z]*
COMENTUNILINEA =("//".*\r\n)|("//".*\n)|("//".*\r)
COMENTMULTILINEA ="/*""/"*([^*/]|[^*]"/"|"*"[^/])*"*"*"*/"

//------> Estados

%%
/*------------  3raa Area: Reglas Lexicas ---------*/

//-----> Palabras Reservadas
"Print" {return new Symbol(Simbolos.RPRINT,yyline,yychar, yytext());} 
"Declare" {return new Symbol(Simbolos.RDECLARE,yyline,yychar, yytext());} 
"Number" {return new Symbol(Simbolos.RNUMBER,yyline,yychar, yytext());} 
"String" {return new Symbol(Simbolos.RSTRING,yyline,yychar, yytext());}
"Boolean" {return new Symbol(Simbolos.RBOOLEAN,yyline,yychar, yytext());}
"Not" {return new Symbol(Simbolos.RNOT,yyline,yychar, yytext());} 
"And" {return new Symbol(Simbolos.RAND,yyline,yychar, yytext());} 
"Or" {return new Symbol(Simbolos.ROR,yyline,yychar, yytext());} 
"True" {return new Symbol(Simbolos.RTRUE,yyline,yychar, yytext());} 
"False" {return new Symbol(Simbolos.RFALSE,yyline,yychar, yytext());}
"If" {return new Symbol(Simbolos.RIF,yyline,yychar, yytext());} 
"Elseif" {return new Symbol(Simbolos.RELSEIF,yyline,yychar, yytext());} 
"Else" {return new Symbol(Simbolos.RELSE,yyline,yychar, yytext());} 
"While" {return new Symbol(Simbolos.RWHILE,yyline,yychar, yytext());} 
"Do" {return new Symbol(Simbolos.RDO,yyline,yychar, yytext());} 
"For" {return new Symbol(Simbolos.RFOR,yyline,yychar, yytext());} 
"Function" {return new Symbol(Simbolos.RFUNCTION,yyline,yychar, yytext());} 
"Void" {return new Symbol(Simbolos.RVOID,yyline,yychar, yytext());} 
"Return" {return new Symbol(Simbolos.RRETURN,yyline,yychar, yytext());} 
"Break" {return new Symbol(Simbolos.RBREAK,yyline,yychar, yytext());} 
"Switch" {return new Symbol(Simbolos.pr_switch,yyline,yychar, yytext());} 
"Case" {return new Symbol(Simbolos.pr_case,yyline,yychar, yytext());} 

//-----> Simbolos

"," {return new Symbol(Simbolos.COMA,yyline,yychar, yytext());} 
";" {return new Symbol(Simbolos.PTCOMA,yyline,yychar, yytext());} 
":" {return new Symbol(Simbolos.dospuntos,yyline,yychar, yytext());} 
"[" {return new Symbol(Simbolos.CORIZQ,yyline,yychar, yytext());} 
"]" {return new Symbol(Simbolos.CORDER,yyline,yychar, yytext());} 
"(" {return new Symbol(Simbolos.parizq,yyline,yychar, yytext());} 
")" {return new Symbol(Simbolos.parder,yyline,yychar, yytext());} 
"{" {return new Symbol(Simbolos.llaveizq,yyline,yychar, yytext());} 
"}" {return new Symbol(Simbolos.llaveder,yyline,yychar, yytext());} 
"+" {return new Symbol(Simbolos.mas,yyline,yychar, yytext());} 
"-" {return new Symbol(Simbolos.menos,yyline,yychar, yytext());} 
"*" {return new Symbol(Simbolos.por,yyline,yychar, yytext());} 
"/" {return new Symbol(Simbolos.div,yyline,yychar, yytext());} 
"&" {return new Symbol(Simbolos.CONCAT,yyline,yychar, yytext());} 
"<>" {return new Symbol(Simbolos.DIFQUE,yyline,yychar, yytext());} 
"==" {return new Symbol(Simbolos.IGUALQUE,yyline,yychar, yytext());} 
"<=" {return new Symbol(Simbolos.MENIGUALQUE,yyline,yychar, yytext());} 
">=" {return new Symbol(Simbolos.MAYIGUALQUE,yyline,yychar, yytext());} 
"<" {return new Symbol(Simbolos.MENQUE,yyline,yychar, yytext());} 
">" {return new Symbol(Simbolos.MAYQUE,yyline,yychar, yytext());} 
"=" {return new Symbol(Simbolos.IGUAL,yyline,yychar, yytext());} 

\n {yychar=1;}

//-------> Simbolos ER
{ID} {return new Symbol(Simbolos.IDENTIFICADOR,yyline,yychar, yytext());} 
{D} {return new Symbol(Simbolos.entero,yyline,yychar, yytext());} 
{DD} {return new Symbol(Simbolos.DECIMAL,yyline,yychar, yytext());} 

//------> Espacios
{BLANCOS}            {/* Espacios en blanco, se ignoran */}

//------> Errores Lexicos
.                       { System.out.println("Error Lexico "+yytext()+" Linea "+yyline+" Columna "+yycolumn);}