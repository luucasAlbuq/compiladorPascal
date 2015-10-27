package tipo;

import java.util.*;

public class TipoFuncao extends Tipo {
	
	Tipo tipoRetorno;
	List<Tipo> tipoParametros;

	public TipoFuncao(Tipo tipoRetorno) {
		this(tipoRetorno, new ArrayList<Tipo>());
	}
	
	public TipoFuncao(Tipo tipoRetorno, List<Tipo> parametros) {
		super(Tipo.FUNCAO, tipoRetorno.width, tipoRetorno.val);
		this.tipoRetorno = tipoRetorno;
		tipoParametros = parametros;
	}
	
	public void addParamTipo(List<Tipo> tipo) {
		tipoParametros.addAll(tipo);
	}
	
	public Tipo getTipoRetorno() {
		return tipoRetorno;
	}
	
	public void setTipoRetorno(Tipo tipo) {
		tipoRetorno = tipo;
	}
	
	public List<Tipo> getTipoParametros() {
		return tipoParametros;
	}
	
	public String getNome() {
		return val;
	}

}
