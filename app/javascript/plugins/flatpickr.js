import flatpickr from 'flatpickr';

// First we define two variables that are going to grab our inputs field. You can check the ids of the inputs with the Chrome inspector.

const datePicker = () => {
  const startDateInput = document.getElementById('weather_search_start_time');
  const endDateInput = document.getElementById('weather_search_end_time');

  // Check that the query selector id matches the one you put around your form.
  if (startDateInput) {
  const unavailableDates = JSON.parse(document.querySelector('#weather-search-times').dataset.unavailable)
  endDateInput.disabled = true

  flatpickr(startDateInput, {
    minDate: "today",
    disable: unavailableDates,
    dateFormat: "Y-m-d",
  });

  console.log('im in the file')

  startDateInput.addEventListener("change", (e) => {
    if (startDateInput != "") {
      endDateInput.disabled = false
    }
    flatpickr(endDateInput, {
      minDate: e.target.value,
      disable: unavailableDates,
      dateFormat: "Y-m-d"
      });
    })
  };
};

export { datePicker };
