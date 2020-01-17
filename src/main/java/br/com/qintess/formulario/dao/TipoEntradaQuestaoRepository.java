package br.com.qintess.formulario.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import br.com.qintess.formulario.entidades.TipoEntradaQuestao;

@Repository
public interface TipoEntradaQuestaoRepository extends JpaRepository<TipoEntradaQuestao, Integer>{

	@Query(value="SELECT tipo_questao.id\n" + 
			"FROM tipo_questao\n" + 
			"WHERE tipo_questao.descricao = :descricao", nativeQuery=true)
	int buscaTipoQuestaoId(@Param("descricao") String tipoEntrada);
}
