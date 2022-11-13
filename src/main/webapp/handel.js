const slider = document.querySelector(".container-slide")
const nextBtn = document.querySelector(".next-btn")
const prevBtn = document.querySelector(".prev-btn")
const slides = document.querySelectorAll(".slide")

var slideNumber = 0

nextBtn.addEventListener("click", () => {
    slideNumber++
    if (slideNumber > slides.length - 1)
        slideNumber = 0
    slides.forEach((slide) => {
        slide.classList.remove("activity");
    })
    slides[slideNumber].classList.add("activity");
})

prevBtn.addEventListener("click", () => {
    slideNumber--
    if (slideNumber < 0)
        slideNumber = slides.length - 1
    slides.forEach((slide) => {
        slide.classList.remove("activity");
    })
    slides[slideNumber].classList.add("activity");
})

var repeater = () => {
    playSlider = setInterval(() => {
        slideNumber++
        if (slideNumber > slides.length - 1)
            slideNumber = 0
        slides.forEach((slide) => {
            slide.classList.remove("activity");
        })
        slides[slideNumber].classList.add("activity");
    }, 3000)
}

slider.addEventListener("mouseover", () => {
    clearInterval(playSlider);
});

slider.addEventListener("mouseout", () => {
    repeater()
});


