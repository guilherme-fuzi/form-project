package br.com.qintess.formulario.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.com.qintess.formulario.entidades.Resposta;

@Repository
public interface RespostaRepository extends JpaRepository<Resposta, Long>{

	@Query(value="SELECT r.id, r.descricao, r.colaborador_id, r.questao_id, r.data_envio\n" + 
			"FROM resposta AS r\n" + 
			"ORDER BY r.id", nativeQuery=true)
	List<Resposta> buscaRespostaOrdenado();
	 
}
