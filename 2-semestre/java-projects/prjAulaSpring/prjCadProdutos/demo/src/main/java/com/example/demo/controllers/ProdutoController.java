package com.example.demo.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.demo.services.ProdutoService;
import com.example.demo.entities.Produto;

@RestController
@RequestMapping("/produtos")
public class ProdutoController {

    private final ProdutoService produtoService;

    public ProdutoController(ProdutoService produtoService) {
        this.produtoService = produtoService;
    }

    @PostMapping
    public Produto criarProduto(@RequestBody Produto produto) {
        return produtoService.criarProduto(produto);
    }

    @GetMapping
    public List<Produto> listarTodos() {
        return produtoService.listarProdutos();
    }

    @GetMapping("/{id}")
    public Produto listarPorId(@PathVariable Long id) {
        return produtoService.getProdutoPorId(id);
    }

    @DeleteMapping("/{id}")
    public void deletarProduto(@PathVariable Long id) {
        produtoService.excluirProduto(id);
    }
}