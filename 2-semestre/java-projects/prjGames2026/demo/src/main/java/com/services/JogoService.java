package com.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.entities.Jogo;
import com.repositories.JogoRepository;

@Service
public class JogoService {

    private final JogoRepository jogoRepository;

    public JogoService(JogoRepository jogoRepository) {
        this.jogoRepository = jogoRepository;
    }

    public Jogo getJogoById(Long id) {
        return jogoRepository.findById(id).orElse(null);
    }

    public List<Jogo> getTodosJogos() {
        return jogoRepository.findAll();
    }

    public Jogo salvarJogo(Jogo jogo) {
        return jogoRepository.save(jogo);
    }

    public Jogo atualizarJogo(Long id, Jogo jogoAtualizado) {
        return jogoRepository.findById(id)
                .map(jogoExistente -> {
                    jogoExistente.setName(jogoAtualizado.getName());
                    jogoExistente.setPlatform(jogoAtualizado.getPlatform());
                    jogoExistente.setPrice(jogoAtualizado.getPrice());
                    jogoExistente.setCategory(jogoAtualizado.getCategory());
                    jogoExistente.setThumbnail(jogoAtualizado.getThumbnail());
                    return jogoRepository.save(jogoExistente);
                })
                .orElse(null);
    }

    public boolean deletarJogo(Long id) {
        if (!jogoRepository.existsById(id)) {
            return false;
        }
        jogoRepository.deleteById(id);
        return true;
    }
}