package br.com.qintess.formulario.entidades;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="tipo_entrada_questao")
@Getter
@Setter
public class TipoEntradaQuestao {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="descricao", nullable=false, length=100)
	private String descricao;
	
	@OneToMany(cascade=CascadeType.ALL, mappedBy="tipoEntradaQuestao")
	private List<Questao> questoes;
	
}
