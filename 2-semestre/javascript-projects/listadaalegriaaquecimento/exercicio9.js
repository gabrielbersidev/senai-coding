let idade = 17;

if(idade<0){
    console.log("Idade Inválida")
} else if(idade>0 && idade<12){
    console.log("Criança")
} else if(idade>=13 && idade<=17){
    console.log("Adolescente")
} else if(idade>=18 && idade<=59){
    console.log("Adulto")
} else{
    console.log("Idoso");
}

