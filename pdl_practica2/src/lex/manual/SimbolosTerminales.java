package lex.manual;

public interface SimbolosTerminales {
	 /* terminals */
	 public static final int EOF = 0;
	 public static final int error = 1;
	// public static final int nombre = 2;
	// public static final int numero = 3;
	// …

	 /* lista de nombres, util para devolver información por pantalla */
	 public static final String[] terminalNames = new String[] {
	 "EOF",
	 "error"
	// ,"nombre",
	// "numero"
	//....
	 };

}
