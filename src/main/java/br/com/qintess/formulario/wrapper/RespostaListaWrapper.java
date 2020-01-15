package br.com.qintess.formulario.wrapper;

import java.util.ArrayList;
import java.util.List;

import br.com.qintess.formulario.entidades.ComplementoResposta;
import br.com.qintess.formulario.entidades.Resposta;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RespostaListaWrapper {
	
	private List<Resposta> listaResposta;
	private List<ComplementoResposta> listaComplementoResposta;
	
	public RespostaListaWrapper() {
		this.listaResposta = new ArrayList<Resposta>();
		this.listaComplementoResposta = new ArrayList<ComplementoResposta>();
	}
	
	public void add(Resposta resposta) {
		this.listaResposta.add(resposta);
	}	
	
	public void add(ComplementoResposta compResposta) {
		this.listaComplementoResposta.add(compResposta);
	}
	
}
