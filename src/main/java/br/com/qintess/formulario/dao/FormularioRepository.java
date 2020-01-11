package br.com.qintess.formulario.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.qintess.formulario.entidades.Formulario;

@Repository
public interface FormularioRepository extends JpaRepository<Formulario, Integer>{

}
