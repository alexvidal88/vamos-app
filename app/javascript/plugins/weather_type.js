
const weatherForm = (event) => {
  // const input = document.getElementById("type");
  const skiParams =  document.getElementById("ski_wrap");
  const marineParams = document.getElementById("marine_wrap");

  if (skiParams || marineParams) {
    const marine_disable = marineParams.querySelector("#marine");
    const ski_disable = skiParams.querySelector("#ski");
    const input = document.getElementById("type");

    input.addEventListener("change", e => {
      console.log(e.target.value);
      if (e.target.value === "weather") {
        skiParams.classList.remove("hidden");
        marineParams.classList.add("hidden");
        marine_disable.disabled = true;
        ski_disable.disabled = false;
      } else if (e.target.value === "marine") {
        marineParams.classList.remove("hidden");
        skiParams.classList.add("hidden");
        ski_disable.disabled = true;
        marine_disable.disabled = false;
      } else {
        marineParams.classList.add("hidden");
        skiParams.classList.add("hidden");
        ski_disable.disabled = true;
        marine_disable.disabled = true;
      }
    });
  };
};

export {weatherForm};
