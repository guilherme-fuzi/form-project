package br.com.qintess.formulario.dao;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.com.qintess.formulario.entidades.Resposta;

@Repository
public interface RespostaRepository extends JpaRepository<Resposta, Integer>{

	/*
	 * @Query(value="", nativeQuery=true) List<Resposta> buscaRespostaOrdenado();
	 */
}
