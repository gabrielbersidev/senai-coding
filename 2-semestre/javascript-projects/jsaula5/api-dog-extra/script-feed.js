const racas = document.getElementById("racas");
const galeria = document.getElementById("galeria");
const mensagem = document.getElementById("mensagem");

let carregando = false;

async function carregarRacas() {
    try {
        const resposta = await fetch("https://dog.ceo/api/breeds/list/all");
        if (!resposta.ok) throw new Error("Erro na API");

        const dados = await resposta.json();
        for (let raca in dados.message) {
            const opcao = document.createElement("option");
            opcao.value = raca;
            opcao.textContent = raca.charAt(0).toUpperCase() + raca.slice(1);
            racas.appendChild(opcao);
        }
    } catch (erro) {
        mensagem.textContent = "Erro ao carregar raças.";
    }
}

function criarPost(urlImagem) {
    const postDiv = document.createElement("div");
    postDiv.classList.add("post");

    const img = document.createElement("img");
    img.src = urlImagem;
    img.alt = "Cachorro aleatório";
    img.loading = "lazy"; 

    const footer = document.createElement("div");
    footer.classList.add("post-footer");
    footer.innerHTML = "❤️ Curtido por doguinhos e outros usuários";

    postDiv.appendChild(img);
    postDiv.appendChild(footer);
    galeria.appendChild(postDiv);
}

async function carregarMaisPosts() {
    if (carregando) return;
    carregando = true;
    mensagem.textContent = "Carregando mais doguinhos...";

    const racaSelecionada = racas.value;
    let url = "";

    if (racaSelecionada === "") {
        url = "https://dog.ceo/api/breeds/image/random/4"; // Puxa de 4 em 4
    } else {
        url = `https://dog.ceo/api/breed/${racaSelecionada}/images/random/4`;
    }

    try {
        const resposta = await fetch(url);
        if (!resposta.ok) throw new Error("Erro na API");

        const dados = await resposta.json();
        
        const imagens = Array.isArray(dados.message) ? dados.message : [dados.message];

        imagens.forEach(urlImg => criarPost(urlImg));
        mensagem.textContent = "";
    } catch (erro) {
        mensagem.textContent = "Erro ao carregar novas imagens.";
    } finally {
        carregando = false;
    }
}

window.addEventListener("scroll", () => {
    const pertoDoFim = window.innerHeight + window.scrollY >= document.documentElement.scrollHeight - 300;

    if (pertoDoFim && !carregando) {
        carregarMaisPosts();
    }
});

racas.addEventListener("change", () => {
    galeria.innerHTML = "";
    carregarMaisPosts();
});

carregarRacas();
carregarMaisPosts();