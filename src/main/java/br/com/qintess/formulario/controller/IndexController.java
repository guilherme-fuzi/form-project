package br.com.qintess.formulario.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.qintess.formulario.entidades.Colaborador;
import br.com.qintess.formulario.entidades.Resposta;
import br.com.qintess.formulario.repository.OpcoesQuestaoRepository;
import br.com.qintess.formulario.repository.QuestaoRepository;
import br.com.qintess.formulario.repository.RespostaRepository;
import br.com.qintess.formulario.repository.TipoEntradaQuestaoRepository;
import br.com.qintess.formulario.wrapper.RespostaListaWrapper;

@Controller
public class IndexController {
	
	@Autowired
	private QuestaoRepository questaoRepository;
	
	@Autowired
	private OpcoesQuestaoRepository opcoesQuestaoRepository;
	
	@Autowired
	private TipoEntradaQuestaoRepository tipoEntradaQuestaoRepository;
	
	@Autowired
	private RespostaRepository respostaRepository;
	
	@RequestMapping
	public String home(Model model) {
		
		return "home";
	}
	
	@RequestMapping("/tecnico")
	public String tecnico(Model model){
		Long idTipoEntrada = tipoEntradaQuestaoRepository.buscaTipoQuestaoId("TECNICO");
		model.addAttribute("listaQuestoes", questaoRepository.buscaQuestaoOrdenado(idTipoEntrada));
		model.addAttribute("listaOpcoesQuestao", opcoesQuestaoRepository.buscaOpcoesQuestaoOrdenado());
		model.addAttribute("resposta", new Resposta());
		model.addAttribute("respostaWrapper", new RespostaListaWrapper());
		model.addAttribute("colaborador", new Colaborador());
		
		return "index";
	}
	
	@RequestMapping("/operacional")
	public String operacional(Model model) {
		Long idTipoEntrada = tipoEntradaQuestaoRepository.buscaTipoQuestaoId("OPERACIONAL");
		model.addAttribute("listaQuestoes", questaoRepository.buscaQuestaoOrdenado(idTipoEntrada));
		model.addAttribute("listaOpcoesQuestao", opcoesQuestaoRepository.buscaOpcoesQuestaoOrdenado());
		model.addAttribute("resposta", new Resposta());
		model.addAttribute("respostaWrapper", new RespostaListaWrapper());
		model.addAttribute("colaborador", new Colaborador());
		
		return "index";
	}
	
	@RequestMapping("/relatorio")
	public String relatorio(Model model) {
		model.addAttribute("dadosResposta", respostaRepository.buscaRespostaOrdenado());
		
		return "relatorio";
	}

}
