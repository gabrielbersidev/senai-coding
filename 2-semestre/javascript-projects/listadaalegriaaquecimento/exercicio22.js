let ladoA = 6;
let ladoB = 6;
let ladoC = 4;

if (ladoA > 0 && ladoB > 0 && ladoC > 0 
    &&
    (ladoA + ladoB > ladoC) 
    &&
    (ladoA + ladoC > ladoB) 
    &&
    (ladoB + ladoC > ladoA))
    {
    // valido

    // agora o tipo
    if (ladoA === ladoB && ladoB === ladoC) {
        console.log("Equilatero");
    } else if (ladoA === ladoB || ladoA === ladoC || ladoB === ladoC) {
        console.log("Isosceles");
    } else {
        console.log("Escaleno");
    }
} else {
    console.log("Nao forma um triângulo");
}