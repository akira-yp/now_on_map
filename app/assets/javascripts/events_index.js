
var mymap = L.map('mapid').setView([35.678362, 139.715387], 13);

L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>',
  maxZoom: 18,
  minZoom: 4,
}).addTo(mymap);

var markers = L.markerClusterGroup();


gon.events.forEach((event) => {
  var content = `<a href="/events/${event.id}">${event.title}</a>`
  var latlon = [event.latitude, event.longitude]
  var marker = L.marker(latlon);
  marker.bindPopup(content).addTo(mymap);
  markers.addLayer(marker);
});
// <% @events.each do |event| %>
  // var categoryIcon = L.icon({
  //   iconUrl: "/centermarker.png",
  //   iconSize:[48,48],
  //   iconAnchor:[24,48]
  // });

mymap.addLayer(markers);