const searchButton = document.getElementById("search");
const returnImage = document.getElementById("random-dog");

async function searchDog(){
    const answer = await fetch(
        "https://dog.ceo/api/breeds/image/random"
    );

    const data = await answer.json();
    
    returnImage.src = data.message;
    returnImage.style.display = "block";
}

searchButton.addEventListener("click", searchDog);