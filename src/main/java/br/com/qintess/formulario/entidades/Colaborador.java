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
@Table(name="colaborador")
@Getter
@Setter
public class Colaborador {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="nome", nullable=false, length=120)
	private String nome;
	
	@Column(name="email", nullable=false, length = 100)
	private String email;
	
	@OneToMany(mappedBy="colaborador", cascade=CascadeType.ALL, orphanRemoval=true)
	private List<Resposta> respostas;

}
