let estoque = 12;
let quantidade = 3;
let precoUnitario = 80;
let saldoCliente = 220;
let clienteVIP = false;

if (quantidade <= 0) {
    console.log("rejeitado: quantidade inválida");
} else if (quantidade > estoque) {
    console.log("rejeitado: quantidade excede o estoque disponível");
} else {
    let subtotal = quantidade * precoUnitario;
    let valorFinal = clienteVIP ? subtotal * 0.90 : subtotal;

    if (saldoCliente >= valorFinal) {
        console.log(`coompra autorizada! valor final: R$ ${valorFinal.toFixed(2)}`);
    } else {
        console.log(`rejeitado: saldo insuficiente (necessário R$ ${valorFinal.toFixed(2)}, disponível R$ ${saldoCliente.toFixed(2)}).`);
    }
}