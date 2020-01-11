package br.com.qintess.formulario.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.qintess.formulario.dao.ColaboradorRepository;
import br.com.qintess.formulario.dao.FormularioRepository;
import br.com.qintess.formulario.entidades.Colaborador;
import br.com.qintess.formulario.entidades.Formulario;

@Controller
public class FormularioController {

	@Autowired
	private FormularioRepository formularioRepository;
	
	@Autowired
	private ColaboradorRepository colaboradorRepository;
	
	@RequestMapping("/formulario/salva")
	public String salva(@ModelAttribute Formulario formulario) {
		Colaborador colaborador = colaboradorRepository.findById(1).get();
		
		formulario.setColaborador(colaborador);
		//formularioRepository.save(formulario);
		
		return "redirect:/";
	}
}
