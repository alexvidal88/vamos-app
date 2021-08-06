const reviewForm = () => {
  const btn = document.querySelectorAll(".toggle");
  if (btn) {
    btn.forEach( button => {
      button.addEventListener("click", () => {
        if (button.nextElementSibling.style.display === "none"){
            button.nextElementSibling.style.display = "block";
            button.innerHTML = "Hide Comments";
        } else {
          button.nextElementSibling.style.display = "none";
          button.innerHTML = "See Comments";
        }
      });
    } );
  }
};

export {reviewForm};

