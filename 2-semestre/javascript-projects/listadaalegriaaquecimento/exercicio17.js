let idade = 22;
let possuiCNH = false;

if (idade >= 18 && possuiCNH) {
    console.log("Pode dirigir");
} else {
    console.log("Não pode dirigir");
    if (idade < 18) {
        console.log("Idade mínima de 18 anos");
    }
    if (!possuiCNH) {
        console.log("Requisito faltando: Possuir CNH");
    }
}