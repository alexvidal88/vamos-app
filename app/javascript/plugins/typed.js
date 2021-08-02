import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const element = document.getElementById('banner-typed-text');
  if (element) {
    new Typed('#banner-typed-text', {
    strings: ["Manage your outdoor activities in a better way"],
    typeSpeed: 50,
    loop: true
    });
  };
}

export { loadDynamicBannerText };
