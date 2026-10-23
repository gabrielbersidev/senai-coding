// > maior
// < menor
// >= maior ou igual
// <= menor ou igual
// == igual
// === estritamente igual
// != diferente
// !=== estritamente diferente

// let numeroUm = 4;
// let numeroDois = 6;

// console.log(`O número ${numeroUm} é maior que ${numeroDois}? ${numeroUm > numeroDois}`);

// console.log(`O número ${numeroUm} é menor que ${numeroDois}? ${numeroUm < numeroDois}`);

// console.log(`O número ${numeroUm} é maior ou igual que ${numeroDois}? ${numeroUm >= numeroDois}`);

// console.log(`O número ${numeroUm} é menor ou igual que ${numeroDois}? ${numeroUm <= numeroDois}`);

// console.log(`O número ${numeroUm} é igual ao ${numeroDois}? ${numeroUm == numeroDois}`);

// console.log(`O número ${numeroUm} é estritamente igual ao ${numeroDois}? ${numeroUm === numeroDois}`);

// console.log(`O número ${numeroUm} é diferente de ${numeroDois}? ${numeroUm != numeroDois}`);

// console.log(`O número ${numeroUm} é estritamente diferente de ${numeroDois}? ${numeroUm !== numeroDois}`);

// Operadores Lógicos

// // Exemplo 1: && E
// let idade = 20;
// let possuiIngresso = true;

// console.log(idade >= 18 && possuiIngresso == true);

// // || OU
// // entrada clube

// let possuiCarteirinha = false;
// let possuiConvite = true;
// console.log(possuiCarteirinha || possuiConvite);

// // Não !
// // chuva

// let estaChovendo = false;
// console.log(!estaChovendo);


// Se e Senão - condições(estado, circunstância, exigência, característica)

// let idade = 20;

// if(idade >= 18){
//     console.log("Você é maior de idade!")
// } else {
//     console.log("Você não é maior de idade!")
// }
// let nota = 7;

// if (nota >= 9) {
//     console.log("Nota excelente!");
// } else if (nota >= 7) {
//     console.log("Nota regular!");
// } else if (nota >= 5) {
//     console.log("Nota ruim!");
// } else if (nota >= 3) {
//     console.log("Nota péssima!");
// } else {
//     console.log("Nota muito abaixo!");
// }

// let nota = 8;
// let frequencia = 80;

// if (nota >= 7 && frequencia >= 75){
//     console.log("Aluno aprovado!");
// }else if(nota >= 5 && frequencia >=60){
//     console.log("Aluno de recuperação!");
// }else{
//     console.log("Aluno reprovado!");
// }
let numeroUm = -15;
let numeroDois = 153;
let numeroTres = -90;

if (numeroUm > 0) {
    console.log(`O Número ${numeroUm} é positivo`);
} else {
    console.log(`O Número ${numeroUm} é negativo`);
}

if (numeroDois > 0) {
    console.log(`O Número ${numeroDois} é positivo`);
} else {
    console.log(`O Número ${numeroDois} é negativo`);
}

if (numeroTres > 0) {
    console.log(`O Número ${numeroTres} é positivo`);
} else {
    console.log(`O Número ${numeroTres} é negativo`);
}


let numeroQuatro = 3456;
let numeroCinco = 8857;
let numeroSeis = 16561561546512;

if (numeroQuatro % 2 === 0) {
    console.log(`O Número ${numeroQuatro} é par`);
} else {
    console.log(`O Número ${numeroQuatro} é ímpar`);
}

if (numeroCinco % 2 === 0) {
    console.log(`O Número ${numeroCinco} é par`);
} else {
    console.log(`O Número ${numeroCinco} é ímpar`);
}

if (numeroSeis % 2 === 0) {
    console.log(`O Número ${numeroSeis} é par`);
} else {
    console.log(`O Número ${numeroSeis} é ímpar`);
}