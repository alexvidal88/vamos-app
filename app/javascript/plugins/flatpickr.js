import flatpickr from 'flatpickr';

// First we define two variables that are going to grab our inputs field. You can check the ids of the inputs with the Chrome inspector.

const datePicker = () => {
  const startDateInput = document.getElementById('weather_search_start_time');
  // const endDateInput = document.getElementById('weather_search_end_time');

  // Check that the query selector id matches the one you put around your form.
  if (startDateInput) {
  // const unavailableDates = JSON.parse(document.querySelector('#weather-search-times').dataset.unavailable)
  // endDateInput.disabled = true

    flatpickr(startDateInput, {
      minDate: "today",
      maxDate: new Date().fp_incr(6),
      // disable: unavailableDates,
      enableTime: true,
      // noCalendar: true,
      dateFormat: "Y-m-d H",
      time_24hr: true,
      disableMobile: "true"
    });

  // startDateInput.addEventListener("change", (e) => {
  //   if (startDateInput != "") {
  //     endDateInput.disabled = false
  //   }
  //   flatpickr(endDateInput, {
  //     minDate: e.target.value,
  //     // maxDate: minDate.fp_incr(14), // 14 days from now
  //     // disable: unavailableDates,
  //     enableTime: true,
  //     // noCalendar: true,
  //     dateFormat: "Y-m-d H:i",
  //     // time_24hr: true
  //     });
  //   })
  // };
  };
};

export { datePicker };
