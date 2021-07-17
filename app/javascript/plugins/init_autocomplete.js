import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('weather_search_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
