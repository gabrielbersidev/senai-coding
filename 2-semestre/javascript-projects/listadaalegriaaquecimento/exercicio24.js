let horas = 5;
let clienteConveniado = true;

if (horas <= 0) {
    console.log("Número de horas inválido.");
} else {
    let valor = 0;
    if (horas <= 2) {
        valor = 10;
    } else {
        valor = 10 + (horas - 2) * 4;
    }

    if (clienteConveniado) {
        valor *= 0.80;
    }

    console.log(`Valor final: R$ ${valor.toFixed(2)}`);
}