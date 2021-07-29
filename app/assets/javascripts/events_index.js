
var mymap = L.map('mapid').setView([35.678362, 139.715387], 13);

L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>',
  maxZoom: 18,
  minZoom: 4,
}).addTo(mymap);

var markers = L.markerClusterGroup();

var markerIcon = L.icon({
  iconUrl: '/assets/marker-icon.png',
  shadowUrl: '/assets/marker-shadow.png',
  iconSize:[26,40],
  iconAnchor:[13,40],
  shoadowSize:[40,40],
  shadowAnchor:[13,40],
  popupAnchor: [0, -40]
});

gon.events.forEach((event) => {
  var category = event.categories.reduce((html,cat) => html + `<span class="category cat-in-popup">${cat}</span>`,`` );
  var content = `<a data-remote="true" href="/events/${event.event.id}"  class="event-title" >${event.event.title}</a><div>${event.date}<div><div>${category}</div>`;
  var latlon = [event.event.latitude, event.event.longitude]
  var marker = L.marker(latlon,{icon: markerIcon, alt: "event-marker"});
  marker.bindPopup(content).addTo(mymap).on('click',getPosition);
  markers.addLayer(marker);
});

//モーダルの地図に位置情報を渡す
function getPosition(e){
  markerPosi = [e.latlng.lat.toFixed(6),e.latlng.lng.toFixed(6)]
};

//leafletの地名検索機能
var options = {
  geocoder: new L.Control.Geocoder.Nominatim()
};
L.Control.geocoder(options).addTo(mymap);


//end_date_gteq_allに検索と同じ値を設定

var startform = document.getElementById('q_start_date_lteq_all');
var endform = document.getElementById('q_end_date_gteq_all');
function inputChange(){
  endform.value = startform.value;
}

startform.addEventListener('input', inputChange);
//
// function popupClick(){
//   let selectedLatlng =
// }
//
// marker.on("click", function (ev) {
//         var chagedPos = ev.target.getLatLng();
//              this.bindPopup(chagedPos.toString()).openPopup();
//              window.location = 'fmp://$/HelloWorld?script=script02&$id='+chagedPos.toString();
// });
// let selectedEvent = document.querySelectorAll('.leaflet-popup-content a')

// $('.leaflet-marker-icon').addEventListener('click', function(){
//   $('.leaflet-popup-content a')
// });



// <% @events.each do |event| %>
  // var categoryIcon = L.icon({
  //   iconUrl: "/centermarker.png",
  //   iconSize:[48,48],
  //   iconAnchor:[24,48]
  // });

mymap.addLayer(markers);

//クリック地点の座標を取得してポップアップする
// var popup = L.popup();
//
// function onMapClick(e) {
//     let latlngArr = e.latlng.split(',')[0];
//     let newlat = latlngArr[0];
//     let newlng = latlngArr[1];
//     popup.setLatLng(e.latlng).setContent("この場所にイベントを投稿する").openOn(mymap);
// };

// mymap.on('click', onMapClick);
