import places from 'places.js';

<<<<<<< HEAD

const initAutocomplete = () => {
  const addressInput = document.getElementById('sock_address');
=======
const initAutocomplete = () => {
  const addressInput = document.getElementById('flat_address');
>>>>>>> master
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
