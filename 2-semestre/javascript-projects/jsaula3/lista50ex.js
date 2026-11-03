function boasVindas() {
    console.log("bem-vindo ao javascript!");
}

boasVindas();

//

function saudacao(nome) {
    console.log(`olá, ${nome}!`);
}

saudacao("Bersi");
saudacao("Isa Marques");
saudacao("Leonard");

//

function soma(a, b) {
    return a + b;
}

console.log(soma(2, 3)); 
console.log(soma(10, 20)); 
console.log(soma(-5, 5));

//

function subtracao(a, b) {
    return a - b;
}

console.log(subtracao(10, 4)); 
console.log(subtracao(5, 10)); 
console.log(subtracao(7, 7));

//

function multiplicacao(a, b) {
    return a * b;
}

console.log(multiplicacao(3, 4));
console.log(multiplicacao(7, 0));  
console.log(multiplicacao(-2, 5)); 

//

function divisao(a, b) {
    if (b === 0) {
        return "erro, divisao por zero nao permitida";
    }
    return a / b;
}

console.log(divisao(10, 2));
console.log(divisao(9, 3)); 
console.log(divisao(5, 0)); 

//

function dobro(n) {
    return n * 2;
}

console.log(dobro(4));
console.log(dobro(15));  
console.log(dobro(-3)); 

//

function triplo(n) {
    return n * 3;
}

console.log(triplo(3));  
console.log(triplo(10)); 
console.log(triplo(0)); 

//

function quadrado(n) {
    return n ** 2;
}

console.log(quadrado(4));
console.log(quadrado(5));
console.log(quadrado(-3)); 

//

function media(n1, n2, n3) {
    return (n1 + n2 + n3) / 3;
}

console.log(media(6, 8, 10)); 
console.log(media(5, 5, 5));   
console.log(media(7, 8, 9));   

//

function parOuImpar(n) {
    return n % 2 === 0 ? "par" : "impar";
}

console.log(parOuImpar(4)); 
console.log(parOuImpar(7));
console.log(parOuImpar(0)); 

//

function maioridade(idade) {
    return idade >= 18 ? "maior de idade" : "menor de idade";
}

console.log(maioridade(15)); 
console.log(maioridade(18));
console.log(maioridade(30));

//

function aprovacao(nota) {
    return nota >= 7 ? "approvado" : "reprovado";
}

console.log(aprovacao(8.5));
console.log(aprovacao(5.0));
console.log(aprovacao(7.0));

//

function maiorDeDois(a, b) {
    return a >= b ? a : b;
}

console.log(maiorDeDois(10, 5));
console.log(maiorDeDois(3, 8)); 
console.log(maiorDeDois(6, 6));

//

function positivoOuNegativo(n) {
    if (n > 0) return "positivo";
    if (n < 0) return "nmegativo";
    return "zero";
}

console.log(positivoOuNegativo(10)); 
console.log(positivoOuNegativo(-4)); 
console.log(positivoOuNegativo(0));

//

function desconto(preco) {
    return preco * 0.9;
}

console.log(desconto(100)); 
console.log(desconto(50));  
console.log(desconto(200));

//

function celsiusParaFahrenheit(c) {
    return c * 9 / 5 + 32;
}

console.log(celsiusParaFahrenheit(0));   
console.log(celsiusParaFahrenheit(25));  
console.log(celsiusParaFahrenheit(100)); 

//

function nomeCompleto(nome, sobrenome) {
    return `${nome} ${sobrenome}`;
}

console.log(nomeCompleto("joão", "marcos"));    
console.log(nomeCompleto("isabella", "marques")); 
console.log(nomeCompleto("gabriel", "pereira"));

//

function senhaValida(senha) {
    return senha.length >= 8;
}

console.log(senhaValida("12345"));
console.log(senhaValida("senha123"));
console.log(senhaValida("abc"));

//

function calculadora(a, b, op) {
    switch (op) {
        case '+': return a + b;
        case '-': return a - b;
        case '*': return a * b;
        case '/': 
            if (b === 0) return "Erro: Divisão por zero";
            return a / b;
        default: return "Operação inválida";
    }
}

console.log(calculadora(10, 5, '+')); 
console.log(calculadora(8, 2, '/'));  
console.log(calculadora(5, 0, '/'));  
console.log(calculadora(4, 2, '%'));

//

const somaArrow = (a, b) => a + b;

console.log(somaArrow(5, 5));   
console.log(somaArrow(-2, 8));  
console.log(somaArrow(12, 13));

//

const dobroArrow = n => n * 2;

console.log(dobroArrow(7));   
console.log(dobroArrow(10));  
console.log(dobroArrow(-5)); 

//
const saudacaoArrow = nome => `olá, ${nome}!`;

console.log(saudacaoArrow("isabela"));     
console.log(saudacaoArrow("jonas"));  
console.log(saudacaoArrow("caio"));

//

const ehPar = n => n % 2 === 0;

console.log(ehPar(4)); 
console.log(ehPar(7)); 
console.log(ehPar(0));

//

const primeiroElemento = arr => arr[0];

console.log(primeiroElemento([10, 20, 30])); 
console.log(primeiroElemento(["a", "b", "c"]));
console.log(primeiroElemento([99, 88]))

//

const ultimoElemento = arr => arr[arr.length - 1];

console.log(ultimoElemento([10, 20, 30])); 
console.log(ultimoElemento(["maçã", "banana", "uva"])); 
console.log(ultimoElemento([5]));

//

const quantidadeElementos = arr => arr.length;

console.log(quantidadeElementos([1, 2, 3, 4, 5]));
console.log(quantidadeElementos([]));
console.log(quantidadeElementos(["x", "y"]));

//

const adicionarElemento = (arr, el) => {
    arr.push(el);
    return arr;
};

console.log(adicionarElemento([1, 2], 3));
console.log(adicionarElemento(["a"], "b"));
console.log(adicionarElemento([], 10));

//

const removerUltimo = arr => {
    arr.pop();
    return arr;
};

console.log(removerUltimo([1, 2, 3]));    
console.log(removerUltimo(["a", "b"])); 
console.log(removerUltimo([10]));

//

const listarNomes = arr => {
    for (let i = 0; i < arr.length; i++) {
        console.log(arr[i]);
    }
};

listarNomes(["Filipe Bersi", "Gabriel Bersi", "Jonas Grubl"]);
listarNomes(["livro", "caneta"]);
listarNomes(["java"]);

//

const nomes = ["thomas", "arthur", "isa"];
nomes.forEach(nome => console.log(nome));

//

const numeros = [10, 20, 30, 40, 50];
numeros.forEach(n => console.log(`numero: ${n}`));

//

const nums = [1, 2, 3, 4, 5];
const dobrados = nums.map(n => n * 2);
console.log(dobrados);

//

const nums2 = [2, 4, 6, 8];
const triplicados = nums2.map(n => n * 3);
console.log(triplicados);

//

const listaNomes = ["ana", "bruno", "carla"];
const maiusculas = listaNomes.map(nome => nome.toUpperCase());
console.log(maiusculas);

//

const precos = [10, 20, 30, 40];
const precosComAumento = precos.map(p => p * 1.1);
console.log(precosComAumento);

//

const sequencia = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
const pares = sequencia.filter(n => n % 2 === 0);
console.log(pares);

//

const impares = sequencia.filter(n => n % 2 !== 0);
console.log(impares);

//

const idades = [12, 18, 25, 14, 30, 16];
const maiores = idades.filter(idade => idade >= 18);
console.log(maiores);

//


const notas = [5, 8, 6, 9, 10, 4, 7];
const aprovadas = notas.filter(nota => nota >= 7);
console.log(aprovadas);

//

const listaNums = [5, 12, 8, 20, 3];
const primeiroMaiorQueDez = listaNums.find(n => n > 10);
console.log(primeiroMaiorQueDez);

//

const nomesArray = ["Ana Julia", "Brunao", "Caioo gabriel", "Felipe"];
const encontraCarlos = nomesArray.find(nome => nome === "Felipe");
console.log(encontraCarlos);

//

const notasLista = [8, 9, 4, 7, 5];
const primeiraBaixa = notasLista.find(nota => nota < 6);
console.log(primeiraBaixa);

//

const numsCheck = [3, 5, -2, 8, 10];
const temNegativo = numsCheck.some(n => n < 0);
console.log(temNegativo);

//

const notasTurma = [3, 5, 6, 8, 4];
const temAprovado = notasTurma.some(nota => nota >= 7);
console.log(temAprovado);

//

const positivos = [2, 4, 6, 8, 10];
const todosPositivos = positivos.every(n => n > 0);
console.log(todosPositivos);

//

const notasClasse = [7, 8, 9, 10, 6];
const todosAprovados = notasClasse.every(nota => nota >= 7);
console.log(todosAprovados);

//

const valores = [10, 20, 30, 40];
const somaTotal = valores.reduce((acc, curr) => acc + curr, 0);
console.log(somaTotal);

//

const notasAluno = [6, 8, 7, 9];
const somaNotas = notasAluno.reduce((acc, curr) => acc + curr, 0);
const mediaFinal = somaNotas / notasAluno.length;
console.log(mediaFinal);

//

const alunos = [
    { nome: "Gabriel", nota: 8 },
    { nome: "Isabella", nota: 5 },
    { nome: "Isabela", nota: 9 },
    { nome: "Arthur", nota: 6 },
    { nome: "Giovana", nota: 7 }
];

const nomesAprovados = alunos
    .filter(aluno => aluno.nota >= 7)
    .map(aluno => aluno.nome);

console.log(nomesAprovados);

