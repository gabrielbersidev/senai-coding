let ladoA = 3;
let ladoB = 4;
let ladoC = 5;

if (ladoA > 0 && ladoB > 0 && ladoC > 0 
    &&
    
    (ladoA + ladoB > ladoC) 
    &&

    (ladoA + ladoC > ladoB) 
    &&

    (ladoB + ladoC > ladoA)
){
    console.log("Formam um triângulo válido");
} else {
    console.log("Não formam um triângulo válido.");
}