let consumoKwh = 250;

if (consumoKwh < 0) {
    console.log("consumo inválido");
} else {
    let tarifa = 0;
    if (consumoKwh <= 100) {
        tarifa = 0.60;
    } else if (consumoKwh <= 200) {
        tarifa = 0.75;
    } else {
        tarifa = 0.90;
    }

    let conta = consumoKwh * tarifa;
    console.log(`Conta total: R$ ${conta.toFixed(2)}`);
}