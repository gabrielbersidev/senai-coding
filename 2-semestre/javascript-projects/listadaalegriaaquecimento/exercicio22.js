let ladoA = 6;
let ladoB = 6;
let ladoC = 4;

if (ladoA > 0 && ladoB > 0 && ladoC > 0 &&
    (ladoA + ladoB > ladoC) &&
    (ladoA + ladoC > ladoB) &&
    (ladoB + ladoC > ladoA)) {
    
    if (ladoA === ladoB && ladoB === ladoC) {
        console.log("Equilátero");
    } else if (ladoA === ladoB || ladoA === ladoC || ladoB === ladoC) {
        console.log("Isósceles");
    } else {
        console.log("Escaleno");
    }
} else {
    console.log("Não forma um triângulo.");
}