package com.example.demo.services;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.entities.Produto;
import com.example.demo.repositories.ProdutoRepository;

@Service
public class ProdutoService {

    private final ProdutoRepository produtoRepository;

    public ProdutoService(ProdutoRepository produtoRepository){
        this.produtoRepository = produtoRepository;
    };
    
    public Produto criarProduto(Produto produto){
        return produtoRepository.save(produto);
    }

    public List<Produto> listarProdutos() {
        return produtoRepository.findAll();
    }

    public Produto getProdutoPorId(Long id){
        return produtoRepository.findById(id).orElse(null);
    }

    public void excluirProduto(Long id){
        produtoRepository.deleteById(id);
    }
}