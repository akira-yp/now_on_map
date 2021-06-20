
var mymap = L.map('mapid').setView([35.678362, 139.715387], 13);

L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>',
  maxZoom: 18,
  minZoom: 4,
}).addTo(mymap);
