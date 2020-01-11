package br.com.qintess.formulario.entidades;

import java.util.Date;
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

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="formulario")
@Getter
@Setter
public class Formulario {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="data_envio")
	@CreationTimestamp
	private Date dataEnvio;
	
	@ManyToOne
	@JoinColumn(name="colaborador_id", nullable=false)
	private Colaborador colaborador;	
	
	@OneToMany(mappedBy="formulario", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Resposta> respostas;
	
}
