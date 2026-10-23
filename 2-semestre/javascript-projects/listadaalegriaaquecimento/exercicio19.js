let nota = 5.8;
let frequencia = 82;

if (frequencia < 75) {
    console.log("Reprovado por frequência");
} else if (nota >= 7) {
    console.log("Aprovado");
} else if (nota >= 5) {
    console.log("Recuperação");
} else {
    console.log("Reprovado por nota");
}