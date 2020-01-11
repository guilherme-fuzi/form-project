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
@Table(name="resposta")
@Getter
@Setter
public class Resposta {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="descricao", nullable=false, length=250)
	private String descricao;
	
	@ManyToOne
	@JoinColumn(name="questao_id", nullable=false)
	private Questao questao;
	
	@ManyToOne
	@JoinColumn(name="formulario_id", nullable=false)
	private Colaborador colaborador;
	
	@OneToMany(mappedBy="resposta",cascade=CascadeType.ALL, orphanRemoval=true)
	private List<ComplementoResposta> complementoResposta;
	
}