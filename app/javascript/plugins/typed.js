import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Manage your outdoor activities in a better way"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
