
async function buscar() {

    const nome = document.getElementById("pokemon").value.toLowerCase();

    const resposta = await fetch(
        `https://pokeapi.co/api/v2/pokemon/${nome}`
    );

    const dados = await resposta.json();

    document.getElementById("nome").innerText = dados.name;
    document.getElementById("imagem").src = dados.sprites.front_default;
    document.getElementById("habilidade").innerText =
        "Habilidade: " + dados.abilities[0].ability.name;
    document.getElementById("peso").innerText =
        "Peso: " + dados.weight;
    document.getElementById("altura").innerText =
        "Altura: " + dados.height;
}
