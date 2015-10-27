package symbTable;

import tipo.Tipo;

public class Simbolo {

	Tipo tipo;
	String nome;
	boolean constante;

	public Simbolo(String nome, Tipo tipo) {
		this(nome, tipo, false);
	}
	
	public Simbolo(String nome, Tipo tipo, boolean constante) {
		this.nome = nome;
		this.tipo = tipo;
		this.constante = constante;
	}

	public Tipo getTipo() {
		return tipo;
	}
	
	public String getNome() {
		return nome;
	}
	
	public boolean ehConstante() {
		return constante;
	}
	
}
