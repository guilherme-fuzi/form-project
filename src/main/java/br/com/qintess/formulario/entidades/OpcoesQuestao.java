package br.com.qintess.formulario.entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="opcoes_questao")
@Getter
@Setter
public class OpcoesQuestao {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="descricao", nullable=false, length=100)
	private String descricao;
	
	@ManyToOne
	@JoinColumn(name="questao_id", nullable=false)
	private Questao questao;

}