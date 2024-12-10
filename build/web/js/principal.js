let slideIndex = 1; // Inicia el índice de las diapositivas en 1
let slideInterval; // Variable para almacenar el intervalo del temporizador

// Función principal para mostrar las diapositivas
function showSlides(n) {
    let i;
    let slides = document.getElementsByClassName("mySlides");
    let dots = document.getElementsByClassName("dot");

    // Si el índice es mayor que la cantidad de slides, vuelve al inicio
    if (n > slides.length) { slideIndex = 1 }
    // Si el índice es menor que 1, se va al final de las slides
    if (n < 1) { slideIndex = slides.length }

    // Ocultamos todas las slides
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }

    // Removemos la clase activa de todos los puntos
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }

    // Mostramos la slide actual y activamos el punto correspondiente
    slides[slideIndex - 1].style.display = "block";
    dots[slideIndex - 1].className += " active";
}

// Función para avanzar o retroceder manualmente entre las diapositivas
function plusSlides(n) {
    clearTimeout(slideInterval); // Limpiamos el temporizador anterior
    showSlides(slideIndex += n); // Mostramos la siguiente o anterior slide
    autoSlides(); // Reiniciamos el temporizador automático
}

// Función para mostrar una slide específica seleccionada
function currentSlide(n) {
    clearTimeout(slideInterval); // Limpiamos el temporizador anterior
    showSlides(slideIndex = n); // Mostramos la slide seleccionada
    autoSlides(); // Reiniciamos el temporizador automático
}

// Función para iniciar el temporizador automático del carrusel
function autoSlides() {
    slideInterval = setTimeout(() => plusSlides(1), 3000); // Avanza automáticamente cada 5 segundos
}

// Inicializa el carrusel mostrando la primera diapositiva
showSlides(slideIndex);
autoSlides();


