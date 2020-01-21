package br.com.qintess.formulario.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.qintess.formulario.entidades.ComplementoResposta;
import br.com.qintess.formulario.entidades.Questao;
import br.com.qintess.formulario.entidades.Resposta;
import br.com.qintess.formulario.repository.ComplementoRespostaRepository;
import br.com.qintess.formulario.repository.OpcoesQuestaoRepository;
import br.com.qintess.formulario.repository.QuestaoRepository;
import br.com.qintess.formulario.repository.RespostaRepository;
import br.com.qintess.formulario.wrapper.RespostaListaWrapper;

@Controller
public class RespostaController {

	@Autowired
	private RespostaRepository respostaRepository;
	
	@Autowired
	private ComplementoRespostaRepository complementoRespostaRepository;
	
	@Autowired 
	private OpcoesQuestaoRepository opcoesRepository;
	
	@Autowired 
	private QuestaoRepository questaoRepository;
	
	@RequestMapping("respostas/salva")
	public String salva(@ModelAttribute RespostaListaWrapper respostas, @RequestParam("selectOption") String[] selectOpcao) {
		respostas = OpcaoRespostaBind(selectOpcao, respostas);
		respostas = ComplementoRespostaBind(respostas);
		
		for (Resposta r : respostas.getListaResposta()) {			
			if(r.getQuestao().getDescricao() != null && r.getDescricao() != null) {
				respostaRepository.save(r);
			}	
		}

		for (ComplementoResposta cr : respostas.getListaComplementoResposta()) {
			if(cr.getResposta() != null && cr.getResposta().getDescricao() != null && cr.getDescricao() != null) {
				complementoRespostaRepository.save(cr);
			}
		}
				
		return "redirect:/";
	}
	
	private RespostaListaWrapper OpcaoRespostaBind(String[] opcoes, RespostaListaWrapper respostas) {
		for (String str : opcoes) {
			Long questaoId = opcoesRepository.buscaQuestaoIdPelaOpcao(str); 
			if(questaoId != null) {
				Questao q = questaoRepository.findById(opcoesRepository.buscaQuestaoIdPelaOpcao(str)).get(); 
				for(Resposta r : respostas.getListaResposta()) { 									
					if(q.getId() == r.getQuestao().getId()) {	 
						r.setDescricao(str);					 
						r.setQuestao(q);
					}
				}	
			}
		}
		
		return respostas;
	}
	
	private RespostaListaWrapper ComplementoRespostaBind(RespostaListaWrapper respostas) {
		for(int i = 0; i < respostas.getListaComplementoResposta().size() && i < respostas.getListaResposta().size(); i++) {
				if( (respostas.getListaResposta().get(i).getQuestao().getTipoEntradaQuestao().getDescricao().equals("MULTICHECKBOX")
						|| respostas.getListaResposta().get(i).getDescricao().equals("SIM")
						|| respostas.getListaResposta().get(i).getQuestao().getTipoEntradaQuestao().getDescricao().equals("DROPDOWN-MULTIPLE")
						|| respostas.getListaResposta().get(i).getQuestao().getTipoEntradaQuestao().getDescricao().equals("FILHO")
							&& respostas.getListaResposta().get(i).getDescricao().contentEquals("SIM"))
						&& respostas.getListaResposta().get(i) != null
						&& respostas.getListaResposta().get(i).getDescricao() != null) {
					Resposta respostaAux = respostas.getListaResposta().get(i);
					respostas.getListaComplementoResposta().get(i).setResposta(respostaAux);
				}
		}
		
		return respostas;
	}
	
}
