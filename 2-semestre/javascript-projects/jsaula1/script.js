// console.log("Hello, world!");
// console.log("Olá, mundo!");

// console.log("teste com aspas duplas");

// console.log('teste com aspas simples');

// //Template literals
// console.log(`testando acento grave`);

// //Tipos de dados

// //Dados que variam:
// //mais moderno - Escopo local
// let nome = "Isabela";
// //versão antiga - Escopo global
// var idade = 17;

// //Dados que não variam: 
// const dataDeNascimento = 2007;

// console.log(nome);
// console.log(idade);

// console.log(nome + idade);
// console.log(nome + " " + idade);
// console.log("Meu nome é " + nome + " e tenho " + idade + " anos!");
// console.log(`Meu nome é ${nome} e tenho ${idade} anos!`);

// //Operadores aritméticos
// //Adição +
// //Subtração -
// //Multiplicação *
// //Divisão /
// //Módulo - Restante %
// //Exponenciação **
// //Incremento ++
// //Decremento --

// // let primeiroNumero = 10;
// // let segundoNumero = 2;
// // console.log(`A soma entre ${primeiroNumero} e ${segundoNumero} é: ${primeiroNumero + segundoNumero}`);
// // console.log(`A subtração entre ${primeiroNumero} e ${segundoNumero} é: ${primeiroNumero - segundoNumero}`);
// // console.log(`A multiplicação entre ${primeiroNumero} e ${segundoNumero} é: ${primeiroNumero * segundoNumero}`);
// // console.log(`A divisão entre ${primeiroNumero} e ${segundoNumero} é: ${primeiroNumero / segundoNumero}`);

// //Operações adicionais
// // console.log(`o resto entre ${primeiroNumero}/${segundoNumero}=${primeiroNumero%segundoNumero}`);
// // console.log(`o ${primeiroNumero} elevado a ${segundoNumero}=${primeiroNumero**segundoNumero}`);

// //Incremento e decremento
// // console.log(`valor original: ${primeiroNumero}`);
// // primeiroNumero++
// // console.log(`valor incrementado: ${primeiroNumero}`);

// // console.log(`valor original: ${segundoNumero}`);
// // segundoNumero--
// // console.log(`valor decrementado: ${segundoNumero}`);


// let numero = 10;

// //Incremento depois de exibir
// console.log(numero++);
// console.log(numero);

// //Incremento antes de exibir
// console.log(++numero);
// console.log(numero);


// let pontos = 10;

// //Operadores de atribuição
// //Calcula e da resultado na mesma variável
// pontos += 5; //resultado 15
// pontos -= 3; //resultado 12
// pontos *= 2; //resultado 24
// pontos %= 3; //resultado 8 resto 0
// pontos **=2 


//Atividade 01
let primeiroNumero = 14;
let segundoNumero = 5;

//1
console.log(`A soma entre ${primeiroNumero} e ${segundoNumero} é: ${primeiroNumero + segundoNumero}`);
console.log(`A subtração entre ${primeiroNumero} e ${segundoNumero} é: ${primeiroNumero - segundoNumero}`);
console.log(`A multiplicação entre ${primeiroNumero} e ${segundoNumero} é: ${primeiroNumero * segundoNumero}`);
console.log(`A divisão entre ${primeiroNumero} e ${segundoNumero} é: ${primeiroNumero / segundoNumero}`);

//2
console.log(`o resto entre ${primeiroNumero}/${segundoNumero}=${primeiroNumero%segundoNumero}`);
console.log(`o ${primeiroNumero} elevado a ${segundoNumero}=${primeiroNumero**segundoNumero}`);

//3
console.log(`O dobro de ${primeiroNumero} é: ${primeiroNumero * 2}`);
console.log(`O triplo de ${primeiroNumero} é: ${primeiroNumero * 3}`);

//4
console.log(`a média aritmética de ${primeiroNumero} e ${segundoNumero} é: ${primeiroNumero+segundoNumero/2}`);

//5
console.log(`${primeiroNumero} ao quadrado é ${primeiroNumero*primeiroNumero}`);
console.log(`${segundoNumero} ao quadrado é ${segundoNumero*segundoNumero}`);

//6
console.log(`${primeiroNumero} é par pois ao ser dividido por dois tem resto igual a ${primeiroNumero%2}`);

//7


let nome = "Carlos";              // string (texto)
let idade = 18;                   // number (numero)
let altura = 1.85;                // number (decimal)
let aprovado = true;              // boolean (verdadeiro)
let reprovado = false;            // boolean (falso)
let endereco ;                    // underfined (não definida)
let telefone = null;              // null (ausência intencional)
let numeroGrande = 123n           // bignt (inteiro grande)
let identificador = Symbol("id")  // symbol (identificador unico)


console.log(typeof nome);
console.log(`O tipo da variável nome é ${typeof nome} com o valor ${nome}`);
console.log(`O tipo da variável idade é ${typeof idade} com o valor ${idade}`);

//Igualdade
console.log(3 == '3');
console.log(3 === '3');

