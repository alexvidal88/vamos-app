import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const element = document.querySelector('.typed-text');
  if (element) {
    new Typed('.typed-text', {
    strings: ["Manage your outdoor activities in a better way"],
    typeSpeed: 70,
    loop: true
    });
  };
}

export { loadDynamicBannerText };
