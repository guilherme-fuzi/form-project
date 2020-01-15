package br.com.qintess.formulario.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import br.com.qintess.formulario.entidades.OpcoesQuestao;

@Repository
public interface OpcoesQuestaoRepository extends JpaRepository<OpcoesQuestao, Integer>{

	@Query(value="SELECT * FROM opcoes_questao ORDER BY id", nativeQuery=true)
	List<OpcoesQuestao> buscaOpcoesQuestaoOrdenado();

	@Query(value="SELECT q.id\n" + 
				 "FROM opcoes_questao AS opcao_q, questao AS q\n" + 
				 "WHERE opcao_q.questao_id = q.id\n" + 
				 "AND  opcao_q.descricao = :descricao"
				 ,nativeQuery=true)
	Integer buscaQuestaoIdPelaOpcao(@Param("descricao") String descricao);
}
