package br.com.qintess.formulario.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.qintess.formulario.entidades.TipoQuestao;

@Repository
public interface TipoQuestaoRepository extends JpaRepository<TipoQuestao, Long>{

}
