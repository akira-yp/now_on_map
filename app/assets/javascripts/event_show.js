
var mymap = L.map('mapid').setView([gon.event.latitude, gon.event.longitude], 16);

L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>',
  maxZoom: 18,
  minZoom: 4,
}).addTo(mymap);

var latlon = [gon.event.latitude, gon.event.longitude]
var marker = L.marker(latlon);
marker.addTo(mymap);
