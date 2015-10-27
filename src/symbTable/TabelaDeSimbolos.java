package symbTable;

import java.util.*;

public class TabelaDeSimbolos {

	public static TabelaDeSimbolos escopoCorrente;
	static TabelaDeSimbolos root = new TabelaDeSimbolos(null);
	static int contadorDeTabelas;

	HashMap<String, Simbolo> table;
	TabelaDeSimbolos anterior;
	List<String> vars;

	public TabelaDeSimbolos(TabelaDeSimbolos anterior) {
		table = new HashMap<String, Simbolo>();
		this.anterior = anterior;
		vars = new ArrayList<String>();
	}

	public static TabelaDeSimbolos getRoot() {
		return root;
	}
	
	public boolean isRoot() {
		return anterior == null;
	}

	public static void inicializa() {
		contadorDeTabelas = 0;
		escopoCorrente = root;
	}

	public static boolean inserir(String nome, Simbolo s) {
		if (!escopoCorrente.table.containsKey(nome)) {
			escopoCorrente.table.put(nome, s);
			return true;
		}
		return false;
	}

	public static void inserirSimbolo(String nome, Simbolo s) {
		TabelaDeSimbolos e = escopoCorrente.anterior;
		e.table.put(nome, s);
	}

	public static boolean inserirVariavel(String nome, Simbolo s) {
		if (!escopoCorrente.table.containsKey(nome)) {
			escopoCorrente.table.put(nome, s);
			escopoCorrente.vars.add(nome);
			return true;
		}
		return false;
	}

	public static Simbolo get(String nome) {
		return get(nome, escopoCorrente);
	}

	public static Simbolo get(String nome, TabelaDeSimbolos tab) {
		for (TabelaDeSimbolos t = tab; t != null; t = t.anterior) {
			Simbolo s = (Simbolo) (t.table.get(nome));
			if (s != null) {
				return s;
			}
		}
		return null;
	}

	static void push(TabelaDeSimbolos tab) {
		contadorDeTabelas++;
		escopoCorrente = new TabelaDeSimbolos(tab);
	}

	public static void push() {
		push(escopoCorrente);
	}

	public static void pop() {
		escopoCorrente = escopoCorrente.anterior;
		contadorDeTabelas++;
	}

}