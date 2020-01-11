package br.com.qintess.formulario.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.qintess.formulario.dao.OpcoesQuestaoRepository;
import br.com.qintess.formulario.dao.QuestaoRepository;

@Controller
public class IndexController {
	
	@Autowired
	private QuestaoRepository questaoRepository;
	
	@Autowired
	private OpcoesQuestaoRepository opcoesQuestaoRepository;
	
	@RequestMapping
	public String index(Model model){
		model.addAttribute("listaQuestoes", questaoRepository.buscaQuestaoOrdenado());
		model.addAttribute("listaOpcoesQuestao", opcoesQuestaoRepository.buscaOpcoesQuestaoOrdenado());
		
		return "index";
	}
	
}
