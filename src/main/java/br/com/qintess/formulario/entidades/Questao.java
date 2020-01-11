package br.com.qintess.formulario.entidades;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="questao")
@Getter
@Setter
public class Questao {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="descricao", nullable=false, length=250)
	private String descricao;
	
	@OneToMany(mappedBy="questao", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<OpcoesQuestao> opcoes;
	
	@ManyToOne
	@JoinColumn(name="tipo_questao_id", nullable=false)
	private TipoQuestao tipoQuestao;
	
	@ManyToOne
	@JoinColumn(name="tipo_entrada_questao_id", nullable=false)
	private TipoEntradaQuestao tipoEntradaQuestao;

}
