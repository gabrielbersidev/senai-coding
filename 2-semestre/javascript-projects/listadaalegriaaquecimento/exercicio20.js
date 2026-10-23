let valorCompra = 380;
let valorPercentual = 0;
let valorDesconto = 0;

if (valorCompra < 100) {
    console.log("Valor final da compra: R$ " + valorCompra);
} else if (valorCompra < 300) {
    valorPercentual = 0.05;
} else if (valorCompra <= 500) {
    valorPercentual = 0.10;
} else {
    valorPercentual = 0.15;
}

valorDesconto = valorCompra * valorPercentual;
valorCompra = valorCompra - valorDesconto;

console.log("Valor final da compra: R$ " + valorCompra.toFixed(2));