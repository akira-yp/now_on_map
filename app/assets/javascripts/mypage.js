if ( gon.events == []){
  var default_latlng = [35.678362, 139.715387]
} else {
  var default_latlng = [gon.events.slice(-1)[0].event.latitude, gon.events.slice(-1)[0].event.longitude]
};

var mymap = L.map('mapid').setView(default_latlng, 8);

L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>',
  maxZoom: 18,
  minZoom: 4,
}).addTo(mymap);

var markers = L.markerClusterGroup();


gon.events.forEach((event) => {
  var category = event.categories.reduce((html,cat) => html + `<span class="category">${cat}</span>`,`` );
  if (event.event.user_id == event.current_user){
    var edit_link = `<div><a data-remote="true" href="/events/${event.event.id}/edit">編集する</a><a href="/events/${event.event.id}" data-method="delete">削除</a></div>`
  } else { edit_link = ''};
  var content = `<a data-remote="true" href="/events/${event.event.id}">${event.event.title}</a><div>${event.date}<div><div>${category}</div>${edit_link}`;
  var latlon = [event.event.latitude, event.event.longitude]
  var marker = L.marker(latlon);
  marker.bindPopup(content).addTo(mymap).on('click',getPosition);
  markers.addLayer(marker);
});

var options = {
  geocoder: new L.Control.Geocoder.Nominatim()
};
L.Control.geocoder(options).addTo(mymap);


var popup = L.popup();

function onMapClick(e) {
  mymap.flyTo([e.latlng.lat,e.latlng.lng], 16, { duration: 1 });
  popup.setLatLng(e.latlng).setContent(`<div><a data-remote="true" href="/events/new?latitude=${e.latlng.lat.toFixed(6)}&longitude=${e.latlng.lng.toFixed(6)}">この場所にイベントを投稿</a></div><div><a data-remote="true" href="/users/${gon.user_id}/mylocations/new?my_latitude=${e.latlng.lat.toFixed(6)}&my_longitude=${e.latlng.lng.toFixed(6)}">この場所にマイロケーションを作成</div>`).openOn(mymap);
}

mymap.on('click', onMapClick);

function getPosition(e){
  markerPosi = [e.latlng.lat.toFixed(6),e.latlng.lng.toFixed(6)]
};

//end_date_gteq_allに検索と同じ値を設定
//
// var startform = document.getElementById('q_start_date_lteq_all');
// var endform = document.getElementById('q_end_date_gteq_all');
// function inputChange(){
//   endform.value = startform.value;
// }
//
// startform.addEventListener('input', inputChange);




// <% @events.each do |event| %>
  // var categoryIcon = L.icon({
  //   iconUrl: "/centermarker.png",
  //   iconSize:[48,48],
  //   iconAnchor:[24,48]
  // });

mymap.addLayer(markers);
