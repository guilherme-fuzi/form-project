package br.com.qintess.formulario.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.com.qintess.formulario.entidades.Questao;


@Repository
public interface QuestaoRepository extends JpaRepository<Questao, Integer>{
	
	@Query(value="SELECT * FROM questao ORDER BY id", nativeQuery=true)
	List<Questao> buscaQuestaoOrdenado();
}
