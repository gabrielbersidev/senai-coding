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

import com.entities.Pet;
import com.services.PetService;

@RestController
@RequestMapping("/pets")
public class PetController {

    private final PetService petService;

    public PetController(PetService petService) {
        this.petService = petService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<Pet> getPet(@PathVariable Long id) {
        Pet pet = petService.getPetById(id);
        if (pet != null) {
            return ResponseEntity.ok(pet);
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping
    public ResponseEntity<List<Pet>> getAllPet() {
        List<Pet> pets = petService.getTodosPets();
        return ResponseEntity.ok(pets);
    }

    @PostMapping(value = "/create", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Pet> criarPet(
            @RequestParam ("idade") int idade,
            @RequestParam("nome") String nome,
            @RequestParam("tipo") String tipo,
            @RequestParam("raca") String raca,
            @RequestParam("sexo") String sexo,
            @RequestParam("tutorNome") String tutorNome,
            @RequestParam(value = "foto", required = false) MultipartFile foto
    ) throws IOException {
        Pet pet = new Pet();
        pet.setNome(nome);
        pet.setIdade(idade);
        pet.setTipo(tipo);
        pet.setRaca(raca);
        pet.setSexo(sexo);
        pet.setTutorNome(tutorNome);

        if (foto != null && !foto.isEmpty()) {
            pet.setFoto(foto.getBytes());
        }

        Pet salvo = petService.salvarPet(pet);
        return ResponseEntity.status(HttpStatus.CREATED).body(salvo);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Pet> atualizarPet(@PathVariable Long id, @RequestBody Pet petAtualizado) {
        Pet pet = petService.atualizarPet(id, petAtualizado);
        if (pet != null) {
            return ResponseEntity.ok(pet);
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletarPet(@PathVariable Long id) {
        boolean removido = petService.deletarPet(id);
        if (removido) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
}