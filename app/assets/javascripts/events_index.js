
var mymap = L.map('mapid').setView([35.678362, 139.715387], 13);

L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>',
  maxZoom: 18,
  minZoom: 4,
}).addTo(mymap);

var markers = L.markerClusterGroup();


gon.events.forEach((event) => {
  var category = event.categories.reduce((html,cat) => html + `<span>${cat}</span>`,`` );
  var content = `<a href="/events/${event.event.id}">${event.event.title}</a><br>${category}`;
  var latlon = [event.event.latitude, event.event.longitude]
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
