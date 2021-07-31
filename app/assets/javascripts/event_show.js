
var mymap2 = L.map('mapid2').setView(markerPosi, 17);

L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>',
  maxZoom: 18,
  minZoom: 4,
}).addTo(mymap2);

// var latlon_show = [gon.event.event.latitude, gon.event.event.longitude]
var marker_show = L.marker(markerPosi,{icon: markerIcon});
marker_show.addTo(mymap2);
