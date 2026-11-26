package com.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.entities.Pet;
import com.repositories.PetRepository;

@Service
public class PetService {

    private final PetRepository petRepository;

    public PetService(PetRepository petRepository) {
        this.petRepository = petRepository;
    }

    public Pet getPetById(Long id) {
        return petRepository.findById(id).orElse(null);
    }

    public List<Pet> getTodosPets() {
        return petRepository.findAll();
    }

    public Pet salvarPet(Pet pet) {
        return petRepository.save(pet);
    }

    public Pet atualizarPet(Long id, Pet petAtualizado) {
        return petRepository.findById(id)
                .map(petExistente -> {
                    petExistente.setNome(petAtualizado.getNome());
                    petExistente.setTipo(petAtualizado.getTipo());
                    petExistente.setRaca(petAtualizado.getRaca());
                    petExistente.setSexo(petAtualizado.getSexo());
                    petExistente.setTutorNome(petAtualizado.getTutorNome());
                    petExistente.setIdade(petAtualizado.getIdade());
                    petExistente.setFoto(petAtualizado.getFoto());
                    return petRepository.save(petExistente);
                })
                .orElse(null);
    }

    public boolean deletarPet(Long id) {
        if (!petRepository.existsById(id)) {
            return false;
        }
        petRepository.deleteById(id);
        return true;
    }
}