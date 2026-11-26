document.getElementById("formPet").addEventListener("submit", function(event) {
    event.preventDefault();

    const dados = new FormData();
    dados.append("nome", document.getElementById("nome").value);
    dados.append("tipo", document.getElementById("tipo").value);
    dados.append("raca", document.getElementById("raca").value);
    dados.append("sexo", document.getElementById("sexo").value);
    dados.append("tutorNome", document.getElementById("tutorNome").value);
    dados.append("idade", document.getElementById("idade").value);

    const arquivoFoto = document.getElementById("foto").files[0];
    if (arquivoFoto) {
        dados.append("foto", arquivoFoto);
    }

    fetch("http://localhost:8080/pets/create", {
        method: "POST",
        body: dados
    })
    .then(response => {
        if (!response.ok) {
            throw new Error("Erro ao cadastrar pet (status " + response.status + ")");
        }
        return response.json();
    })
    .then(data => {
        alert("Pet cadastrado com sucesso!");
        document.getElementById("formPet").reset();
    })
    .catch(error => {
        alert("Erro ao cadastrar: " + error.message);
    });
});