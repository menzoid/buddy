const flipCard = () => {
  const cards = document.querySelectorAll('.card-whole');
  if (cards) {
    cards.forEach((card) => {
      card.addEventListener('click', function () {
        console.log(card);
        card.firstElementChild.classList.toggle('hidden');
        card.lastElementChild.classList.toggle('hidden');
      });
    })
  }
};

export { flipCard };
