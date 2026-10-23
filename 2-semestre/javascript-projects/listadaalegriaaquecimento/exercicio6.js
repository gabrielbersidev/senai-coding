let valorCompra = 150;
let clienteVIP = true;

if(valor >= 200 || clienteVIP){
    valorCompra = valorCompra*0.20;
    console.log("Valor da compra com desconto aplicado: "+valorCompra);
} else {
    console.log("Valor da compra sem desconto aplicado: "+valorCompra);
}

