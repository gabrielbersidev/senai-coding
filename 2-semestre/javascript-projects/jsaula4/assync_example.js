// // console.log('Primeiro');

// // setTimeout(() => {
// //     console.log('Segundo');
// // }, 2000);

// // console.log('Terceiro')


// const pedido = new Promise((resolve, reject) =>{
//     setTimeout(() =>{
//         resolve("Pedido Ponto!");
//     }, 3000);
// });

// pedido.then((resultado) => {
//     console.log(resultado);
// });

// // sucesso
// resolve()
// then()

// // fracasso
// reject()
// catch()

// async e await

function prepararPedido(){
    return new Promise((resolve) => {
        setTimeout(() =>  {
            resolve("Pedido Pronto");
        },3000)
    });
};

async function Iniciar() {
    console.log("Preparando...");

    const resultado = await prepararPedido();

    console.log(resultado);
}

Iniciar()