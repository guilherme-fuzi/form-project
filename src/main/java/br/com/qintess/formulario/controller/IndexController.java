package br.com.qintess.formulario.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.qintess.formulario.dao.OpcoesQuestaoRepository;
import br.com.qintess.formulario.dao.QuestaoRepository;
import br.com.qintess.formulario.entidades.Colaborador;
import br.com.qintess.formulario.entidades.ComplementoResposta;
import br.com.qintess.formulario.entidades.Resposta;
import br.com.qintess.formulario.wrapper.RespostaListaWrapper;

@Controller
public class IndexController {
	
	@Autowired
	private QuestaoRepository questaoRepository;
	
	@Autowired
	private OpcoesQuestaoRepository opcoesQuestaoRepository;
	
	@RequestMapping("/tecnico")
	public String tecnico(Model model){
		model.addAttribute("listaQuestoes", questaoRepository.buscaQuestaoOrdenado(2));
		model.addAttribute("listaOpcoesQuestao", opcoesQuestaoRepository.buscaOpcoesQuestaoOrdenado());
		model.addAttribute("resposta", new Resposta());
		model.addAttribute("respostaWrapper", new RespostaListaWrapper());
		model.addAttribute("colaborador", new Colaborador());
		
		return "index";
	}
	
	@RequestMapping("/operacional")
	public String operacional(Model model) {
		model.addAttribute("listaQuestoes", questaoRepository.buscaQuestaoOrdenado(1));
		model.addAttribute("listaOpcoesQuestao", opcoesQuestaoRepository.buscaOpcoesQuestaoOrdenado());
		model.addAttribute("resposta", new Resposta());
		model.addAttribute("respostaWrapper", new RespostaListaWrapper());
		model.addAttribute("colaborador", new Colaborador());
		
		return "index";
	}
	
	@RequestMapping
	public String home(Model model) {
		
		return "home";
	}

}
