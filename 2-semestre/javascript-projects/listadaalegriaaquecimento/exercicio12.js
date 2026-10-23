let totalCompra = 180;
let cupomFrete = true;
let valorFrete = 0;

if(totalCompra >= 250 || cupomFrete ){
    console.log("Frete Grátis. Valor da compra: "+valorCompra);
} else {
    let valorFrete = 25;
    totalCompra = totalCompra+valorFrete
    console.log("Valor a pagar com frente incluso de "+valorFrete+"R$"+": "+totalCompra);
}

