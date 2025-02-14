document.addEventListener("DOMContentLoaded", function() {
  const stars = document.querySelectorAll(".star");
  const ratingInput = document.getElementById("review_rating");

  stars.forEach(star => {
    star.addEventListener("click", function() {
      let value = this.getAttribute("data-value");
      ratingInput.value = value;

      stars.forEach(s => s.classList.remove("selected"));
      this.classList.add("selected");

      for (let i = 0; i < value; i++) {
        stars[i].classList.add("selected");
      }
    });
  });

  // 既存のレビュー評価を星に変換
  document.querySelectorAll(".stars").forEach(starContainer => {
    let rating = parseInt(starContainer.dataset.rating);
    for (let i = 0; i < rating; i++) {
      starContainer.innerHTML += "★";
    }
    for (let i = rating; i < 5; i++) {
      starContainer.innerHTML += "☆";
    }
  });
});