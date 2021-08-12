import mapboxgl from '!mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder';
// import MapboxDirections from '@mapbox/mapbox-gl-directions';

// var MapboxDirections = require('@mapbox/mapbox-gl-directions');

var directions = new MapboxDirections({
  accessToken: 'pk.eyJ1IjoiYWxleHZpZGFsODgiLCJhIjoiY2txcnUzYzk3MmtlMjJwcXR2c3JhcHY3NSJ9.3fvSQfD1JaDk8vsFY7kODg',
  unit: 'metric',
  profile: 'mapbox/cycling'
});

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/alexvidal88/ckrzv79zp1eb518q2ae5uywhr',
    center: [-74.5, 40], // starting position [lng, lat]
    zoom: 0.01 // starting zoom
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    console.log(marker)
    const popup = new mapboxgl.Popup().setHTML(marker.info_window);

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 20, maxZoom: 15, duration: 50 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      // mapboxgl: mapboxgl }));
    // console.log(direction);
    map.addControl(directions, 'top-left');
  }
};

export { initMapbox };
