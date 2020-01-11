package br.com.qintess.formulario.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.qintess.formulario.entidades.TipoQuestao;

@Repository
public interface TipoQuestaoRepository extends JpaRepository<TipoQuestao, Integer>{

}
