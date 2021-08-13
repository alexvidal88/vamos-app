import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const element = document.querySelector('.typed-text');
  const community = document.querySelector('.typed-text-community');
  const index = document.querySelector('.typed-text-index');
  if (element) {
    new Typed('.typed-text', {
    strings: ["Manage your outdoor activities in a better way"],
    typeSpeed: 70,
    loop: true
    });
  };
  if (community) {
    new Typed('.typed-text-community', {
    strings: ["Share your first search with the Community"],
    typeSpeed: 70,
    loop: true
    });
  };
  if (index) {
    new Typed('.typed-text-index', {
    strings: ["The forecast is up to you"],
    typeSpeed: 70,
    loop: true
    });
  };
}

export { loadDynamicBannerText };
