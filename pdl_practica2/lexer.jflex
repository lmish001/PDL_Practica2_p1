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



InputCharacter = [^\r\n]

/*Numero entero decimal*/
NumLiteral = [0-9]*
Dec_Number = {NumLiteral}"."{NumLiteral} | "."{NumLiteral}

/*Numero entero hexadecimal*/
HexLiteral = [0-9a-fA-F]*
Hex_Number = 0 [xX] [1-9a-fA-F] {HexLiteral}

/*Dirección email*/
Email = {Palabra}"@"{Palabra}".com"

/*DNI España*/
DNI = [0-9]{8}[a-zA-Z]

/*Matricula turismo*/
Matricula = [0-9]{8}[a-zA-Z]{3}

/* Palabra*/
Palabra = {InputCharacter}*

%eofval{
 return new Symbol(EOF);
%eofval}

/* Macros para expresiones regulares (para simplificar reglas) */

%% 

/* Reglas para detectar los tokens y acciones asociadas */
<YYINITIAL> {
	  {Whitespace} {}
	  {Dec_Number} { return new Symbol (dec_number, "DEC_NUMBER"); }
	  {Hex_Number} { return new Symbol (hex_number, "HEX_NUMBER"); }
	  {Email}	   { return new Symbol (email, "EMAIL"); }
	  {DNI}        { return new Symbol (dni, "DNI"); }
	  {Matricula}  { return new Symbol (matricula, "MATRICULA"); }
	  {Palabra}    { return new Symbol (palabra, "PALABRA"); }
}



// error fallback
.|\n {System.err.println("warning: Unrecognized character '"
 + yytext()+"' -- ignored" + " at : "+ (yyline+1) + " " +
 (yycolumn+1) + " " + yychar); }