let idade = 17;
let notaProva = 82;
let frequencia = 88;
let autorizacaoResponsavel = true;
let possuiPendencia = false;

let idadeValida = idade >= 14 && idade <= 20;
let notaValida = notaProva >= 70;
let frequenciaValida = frequencia >= 80;
let semPendencia = !possuiPendencia;
let autorizacaoValida = idade >= 18 || autorizacaoResponsavel;

if (idadeValida && notaValida && frequenciaValida && semPendencia && autorizacaoValida) {
    console.log("inscrição aprovada");
} else {
    console.log("inscrição recusada");
    if (!idadeValida) console.log("motivo: Idade fora da faixa permitida (14 a 20 anos)");
    if (!notaValida) console.log("motivo: Nota da prova inferior a 70");
    if (!frequenciaValida) console.log("motivo: Frequência inferior a 80%");
    if (!semPendencia) console.log("motivo: Candidato possui pendências cadastrais");
    if (!autorizacaoValida) console.log("motivo: Menor de idade sem autorização do responsável");
}