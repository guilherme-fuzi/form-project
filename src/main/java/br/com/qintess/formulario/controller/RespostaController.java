package br.com.qintess.formulario.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.qintess.formulario.dao.ComplementoRespostaRepository;
import br.com.qintess.formulario.dao.OpcoesQuestaoRepository;
import br.com.qintess.formulario.dao.QuestaoRepository;
import br.com.qintess.formulario.dao.RespostaRepository;
import br.com.qintess.formulario.entidades.ComplementoResposta;
import br.com.qintess.formulario.entidades.Questao;
import br.com.qintess.formulario.entidades.Resposta;
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
		
		//printando as respostas prestes a serem salvas
		for (Resposta r : respostas.getListaResposta()) {
			if(r.getQuestao().getDescricao() != null && r.getDescricao() != null) {
				
				System.out.println("QUESTAO: "  + r.getQuestao().getDescricao());
				System.out.println("RESPOSTA: " + r.getDescricao());
				System.out.println("------------");
				
				//respostaRepository.save(r);
			}
		}
		
		for (ComplementoResposta cr : respostas.getListaComplementoResposta()) {
			if(cr.getResposta() != null && cr.getResposta().getDescricao() != null && cr.getDescricao() != null) {
				
				System.out.println("RESPOSTA: " + cr.getResposta().getDescricao() + 
						           "\n COMPLEMENTO: " + cr.getDescricao());
				System.out.println("------------");
				
				//complementoRespostaRepository.save(cr);
			}
		}
		System.out.println("Size of ListaResposta: " + respostas.getListaResposta().size() +
							"\nSize of ListaComplementoRespostas: " + respostas.getListaComplementoResposta().size());
		
		
		return "redirect:/";
	}
	
	private RespostaListaWrapper OpcaoRespostaBind(String[] opcoes, RespostaListaWrapper respostas) {
		
		for (String str : opcoes) {
			Integer questaoId = opcoesRepository.buscaQuestaoIdPelaOpcao(str); 
			if(questaoId != null) {
				Questao q = questaoRepository.findById(opcoesRepository.buscaQuestaoIdPelaOpcao(str)).get(); //procura questao atraves descricao da resposta
				for(Resposta r : respostas.getListaResposta()) { //precisamos saber em qual questao devemos colocar a opcao, portanto percorremos a lista das respostas,									
					if(q.getId() == r.getQuestao().getId()) {	 //comparamos com a questao 'q' para encontrar o lugar correto na lista
						r.setDescricao(str);					 //por fim adicinamos a questao 'q' a lista de respostas
						r.setQuestao(q);
					}
				}	
			} else {
				System.out.println("dropdown nao selecionado");
			}
		}
		System.out.println("OpcaoRespostaBind OK!");
		
		return respostas;
	}
	
	
	private RespostaListaWrapper ComplementoRespostaBind(RespostaListaWrapper respostas) {
		//String respostaString = "";
		for(int i = 0; i < respostas.getListaComplementoResposta().size() && i < respostas.getListaResposta().size(); i++) {
				if( (respostas.getListaResposta().get(i).getQuestao().getTipoEntradaQuestao().getDescricao().equals("MULTICHECKBOX")
						|| respostas.getListaResposta().get(i).getDescricao().equals("SIM"))
						&& respostas.getListaResposta().get(i) != null
						&& respostas.getListaResposta().get(i).getDescricao() != null) {
					Resposta respostaAux = respostas.getListaResposta().get(i);
					respostas.getListaComplementoResposta().get(i).setResposta(respostaAux);
				}
			
				/*
				//if para perguntas, perguntas de SIM/NAO e considerando os nulos
				if(respostas.getListaResposta().get(i).getDescricao().equals("SIM") 
						&& respostas.getListaResposta().get(i) != null 
						&& respostas.getListaResposta().get(i).getDescricao() != null) { //verificamos se a resposta tem complemento
					Resposta respostaAux = respostas.getListaResposta().get(i);
					respostas.getListaComplementoResposta().get(i).setResposta(respostaAux);
				}
				//if para perguntas tecnologia/idioma/outro e considerando nulos (concatenar strings das respostas!!!)
				if( (respostas.getListaResposta().get(i).getDescricao().contains("TECNOLOGIA") 
						|| respostas.getListaResposta().get(i).getDescricao().contains("IDIOMA")
						|| respostas.getListaResposta().get(i).getDescricao().contains("OUTRO"))
						&& respostas.getListaResposta().get(i) != null
						&& respostas.getListaResposta().get(i).getDescricao() != null) {
					
					Resposta respostaAux = respostas.getListaResposta().get(i);
					respostaString.concat(respostas.getListaComplementoResposta().get(i).getDescricao() + ";");
					System.out.println("respostaString: " + respostaString);
					//respostaAux.setDescricao(respostaString);
					respostas.getListaComplementoResposta().get(i).setResposta(respostaAux);
					
				}
				*/
		}
		
		return respostas;
	}
}
