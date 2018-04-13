package lex.manual;

public interface SimbolosTerminales {
	 /* terminals */
	 public static final int EOF = 0;
	 public static final int error = 1;
	 public static final int palabra = 2;
	 public static final int dec_number = 3;
	 public static final int hex_number = 4;
	 public static final int email = 5;
	 public static final int dni = 6;
	 public static final int matricula = 7;
	// …

	 /* lista de nombres, util para devolver información por pantalla */
	 public static final String[] terminalNames = new String[] {
	 "EOF",
	 "error",
	 "palabra",
	 "dec_number",
	 "hex_number",
	 "email",
	 "dni",
	 "matricula"
	// "numero"
	//....
	 };

}
