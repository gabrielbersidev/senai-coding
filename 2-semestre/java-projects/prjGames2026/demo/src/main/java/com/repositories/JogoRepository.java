package com.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.entities.Jogo;

public interface JogoRepository extends JpaRepository<Jogo, Long> {

}