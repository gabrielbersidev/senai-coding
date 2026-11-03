function somar(a,b){
    return a+b;
}

function subtrair(a,b){
    return a-b;
}

function multiplicar(a,b){
    return a*b;
}

function dividir(a,b){
    if(b === 0 || a === 0){
        return "Divisão por zero"
    } else{
        return a/b;
    }
}
console.log(somar(10,5));
console.log(subtrair(10,5));
console.log(multiplicar(10,5));
console.log(dividir(10,0));


//


// 1- Função nomeada

function multiplicar(a,b){
    return `${a} * ${b} = ${a*b}`
}


// 2- Função não nomeada
const multiplica = function(a,b){
    return `${a} * ${b} = ${a*b}`
}


// 3 - Função de flecha - Arrow function - Moderno
const multiplicarArrow = (a,b) => `${a} * ${b} = ${a*b}`;

//

function cumprimentar(nome){
    console.log(`Olá, ${nome}`);
}

const cumprimentar = function(nome){
    console.log(`Olá, ${nome}`);
}

const cumprimentarArrow = (nome) => console.log(`Olá ${nome}!`);

// HOFS de array
// forEach Percorre todos os elementos
// Map Transforma todos os elementos
// Filter Filtra os elementos
// find Encontrar um elemento
// some Verifica se algum elemento atende
// every verifica se todos os elementos atendem
// reduce acumula resultados
// ----

// forEach
// let alunos = ["Ana", "Bruno", "Carlos", "José"];

// alunos.forEach((aluno) => {
//     console.log(`Bom dia, ${aluno}`);
// })

// map
// let numeros = [1,2,3,4,5,6,7,8,9,10];

// let dobrados = numeros.map((numero) => {
//     return numero * 2
// });

// filter
// let idades = [12, 15, 17, 19, 25,, 74]

// let maiores = idades.filter((idade) =>{
//     return idade >= 18;
// });


// find

// let alunos = [
//     {nome:"Leandro", nota: 8},
//     {nome:"Leandro", nota: 8},
//     {nome:"Leandro", nota: 8}
// ]

// let aluno = alunos.find((aluno) => {
//     return aluno.nota >= 7;
// })

// SOME

// let notas = [5, 7, 8, 9, 10, 2, 4, 6, 4, 6, 7, 3]

// let existeAlgumAprovado = notas.some((nota) =>{
//     return nota => 7;
// })

// console.log(existeAlgumAprovado);

// EVERY

// let todosAprovados = notas.every((nota) => {
//     return nota >= 7;
// })

// console.log(todosAprovados);


// REDUCE

// let numeros = [10,20,30];

// let soma = numeros.reduce((acumulador, numero) =>{
//     return acumulador + numero
// }, 0)