const flip = () => {

  const element = document.querySelector(".card-flip")
  function transformFunction() {
    if (element.style.transform == "rotateY(180deg)") {
      element.style.transform = "rotateY(0deg)";
    }
    else {
      element.style.transform = "rotateY(180deg)";
    }
  }
  if (element) {
    element.addEventListener("click", transformFunction)
  }

};

export { flip }
