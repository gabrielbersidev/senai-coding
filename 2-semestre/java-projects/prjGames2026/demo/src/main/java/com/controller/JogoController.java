package com.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.entities.Jogo;
import com.services.JogoService;

@RestController
@RequestMapping("/jogos")
public class JogoController {

    private final JogoService jogoService;

    public JogoController(JogoService jogoService) {
        this.jogoService = jogoService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<Jogo> getJogo(@PathVariable Long id) {
        Jogo jogo = jogoService.getJogoById(id);
        if (jogo != null) {
            return ResponseEntity.ok(jogo);
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping
    public ResponseEntity<List<Jogo>> getAllJogos() {
        List<Jogo> jogos = jogoService.getTodosJogos();
        return ResponseEntity.ok(jogos);
    }

    @PostMapping(value = "/create", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Jogo> criarJogo(
            @RequestParam("name") String name,
            @RequestParam("platform") String platform,
            @RequestParam("price") Double price,
            @RequestParam("category") String category,
            @RequestParam(value = "thumbnail", required = false) MultipartFile thumbnail
    ) throws IOException {
        Jogo jogo = new Jogo();
        jogo.setName(name);
        jogo.setPlatform(platform);
        jogo.setPrice(price);
        jogo.setCategory(category);

        if (thumbnail != null && !thumbnail.isEmpty()) {
            jogo.setThumbnail(thumbnail.getBytes());
        }

        Jogo salvo = jogoService.salvarJogo(jogo);
        return ResponseEntity.status(HttpStatus.CREATED).body(salvo);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Jogo> atualizarJogo(@PathVariable Long id, @RequestBody Jogo jogoAtualizado) {
        Jogo jogo = jogoService.atualizarJogo(id, jogoAtualizado);
        if (jogo != null) {
            return ResponseEntity.ok(jogo);
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletarJogo(@PathVariable Long id) {
        boolean removido = jogoService.deletarJogo(id);
        if (removido) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
}