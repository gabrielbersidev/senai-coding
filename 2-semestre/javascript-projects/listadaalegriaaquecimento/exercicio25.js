let velocidade = 92;
let limite = 80;
let limite20 = limite * 1.20;

if (velocidade <= limite) {
    console.log("Dentro do limite");
} else if (velocidade <= limite20) {
    console.log("Acima do limite");
} else {
    console.log("Muito acima do limite");
}