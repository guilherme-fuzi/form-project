package br.com.qintess.formulario.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.com.qintess.formulario.entidades.OpcoesQuestao;

@Repository
public interface OpcoesQuestaoRepository extends JpaRepository<OpcoesQuestao, Integer>{

	@Query(value="SELECT * FROM opcoes_questao ORDER BY id", nativeQuery=true)
	List<OpcoesQuestao> buscaOpcoesQuestaoOrdenado();
}
