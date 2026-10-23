let estoque = 4;
let quantidadePedida = 6;

if (quantidadePedida <= 0) {
    console.log("Pedido inválido, a quantidade deve ser positiva");
} else if (quantidadePedida <= estoque) {
    console.log("Venda autorizada");
    estoque -= quantidadePedida;
    console.log("Novo estoque:", estoque);
} else {
    console.log("Venda não autorizada: quantidade pedida ultrapassa o estoque disponível");
}