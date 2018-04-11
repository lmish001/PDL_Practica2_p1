package lex.manual;

public class Symbol {
	
	/*Atributos*/
	
	private int type;
	private Object value;
	
	public Symbol(int tipo) {
		this.type = tipo;
		this.value = null;
	}
	
	public Symbol(int tipo, Object valor) {
		this.type = tipo;
		this.value = valor;
	}
	
	public int type(){
		return this.type;
	}
	
	public Object value(){
		return this.value;
	}

}
