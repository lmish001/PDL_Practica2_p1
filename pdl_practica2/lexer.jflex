package lex.generado; // paquete en el que se genera el fichero java
import lex.manual.SimbolosTerminales; //Simbolos terminales definidos
import lex.manual.Symbol;

%%

%class Lexer
%implements SimbolosTerminales
%public
%unicode

%line
%column
%char

%function next_token // Nombre del método que escanea la entrada y
 // devuelve el siguiente token
%type Symbol // Tipo de retorno para la función de scan

Whitespace = [ \t\f] | {LineTerminator}
LineTerminator = \r|\n|\r\n



InputCharacter = [^\r\n \t\f]
InputCharacterEmail = [a-zA-Z0-9.]

/*Numero entero decimal*/
NumLiteral = [0-9]*
Dec_Number = {NumLiteral}"."{NumLiteral} | "."{NumLiteral}

/*Numero entero hexadecimal*/
HexLiteral = [0-9a-fA-F]*
Hex_Number = 0 [xX] [1-9a-fA-F] {HexLiteral}

/*Dirección email*/
Email = {PalabraEmail}"@"{PalabraEmail}".com"

/*DNI España*/
DNI = [0-9]{8}[a-zA-Z]

/*Matricula turismo*/
Matricula = [0-9]{8}[a-zA-Z]{3}

/* Palabra*/
Palabra = {InputCharacter}*
PalabraEmail = {InputCharacterEmail}{InputCharacterEmail}*

%eofval{
 return new Symbol(EOF);
%eofval}

/* Macros para expresiones regulares (para simplificar reglas) */

%% 

/* Reglas para detectar los tokens y acciones asociadas */
<YYINITIAL> {
	  {Whitespace} {}
	  {Dec_Number} { return new Symbol (dec_number, Float.parseFloat(yytext())); }
	  {Hex_Number} { return new Symbol (hex_number, Integer.parseInt(yytext().substring(2, yytext().length()), 16)); }
	  {Email}	   { return new Symbol (email, yytext()); }
	  {DNI}        { return new Symbol (dni, yytext()); }
	  {Matricula}  { return new Symbol (matricula, yytext()); }
	  {Palabra}    { return new Symbol (palabra, yytext()); }
}



// error fallback
.|\n {System.err.println("warning: Unrecognized character '"
 + yytext()+"' -- ignored" + " at : "+ (yyline+1) + " " +
 (yycolumn+1) + " " + yychar); }