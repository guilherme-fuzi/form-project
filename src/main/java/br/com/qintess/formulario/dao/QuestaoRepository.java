package br.com.qintess.formulario.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import br.com.qintess.formulario.entidades.Questao;


@Repository
public interface QuestaoRepository extends JpaRepository<Questao, Integer>{
	
	@Query(value="SELECT DISTINCT q.id, q.descricao, q.tipo_entrada_questao_id, q.tipo_questao_id\n" + 
				 "FROM questao AS q, tipo_questao AS tq\n" + 
				 "WHERE q.tipo_questao_id = tq.id\n" + 
				 "	AND (tq.id = 3 OR tq.id = :id)\n" + 
				 "ORDER BY q.id", nativeQuery=true)
	List<Questao> buscaQuestaoOrdenado(@Param("id") int idEntrada);
}
