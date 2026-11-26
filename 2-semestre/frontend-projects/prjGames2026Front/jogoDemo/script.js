document.getElementById("formJogo").addEventListener("submit", function(event) {
    event.preventDefault();

    const dados = new FormData();
    dados.append("name", document.getElementById("name").value);
    dados.append("platform", document.getElementById("platform").value);
    dados.append("price", document.getElementById("price").value);
    dados.append("category", document.getElementById("category").value);

    const arquivoThumbnail = document.getElementById("thumbnail").files[0];
    if (arquivoThumbnail) {
        dados.append("thumbnail", arquivoThumbnail);
    }

    fetch("http://localhost:8080/jogos/create", {
        method: "POST",
        body: dados
    })
    .then(response => {
        if (!response.ok) {
            throw new Error("Erro ao cadastrar jogo (status " + response.status + ")");
        }
        return response.json();
    })
    .then(data => {
        alert("Jogo cadastrado com sucesso!");
        document.getElementById("formJogo").reset();
    })
    .catch(error => {
        alert("Erro ao cadastrar: " + error.message);
    });
});