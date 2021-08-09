if ( gon.events.length == 0 ){
  var default_latlng = [35.681833, 139.749949];
} else {
  var default_latlng = [gon.events.slice(-1)[0].event.latitude, gon.events.slice(-1)[0].event.longitude]
};

var mymap = L.map('mapid').setView(default_latlng, 12);

L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>',
  maxZoom: 18,
  minZoom: 4,
}).addTo(mymap);

var markers = L.markerClusterGroup();

//
var markerIcon = L.icon({
  iconUrl: '/imgs/marker-icon.png',
  shadowUrl: '/imgs/marker-shadow.png',
  iconSize:[26,40],
  iconAnchor:[13,40],
  shoadowSize:[40,40],
  shadowAnchor:[13,40],
  popupAnchor: [0, -40]
});

gon.events.forEach((event) => {
  var category = event.categories.reduce((html,cat) => html + `<span class="category">${cat}</span>`,`` );
  if (event.event.user_id == event.current_user){
    var edit_link = `<div class="popup"><a data-remote="true" href="/events/${event.event.id}/edit">編集</a><a href="/events/${event.event.id}" data-method="delete">削除</a></div>`
  } else { edit_link = ''};
  var content = `<a data-remote="true" href="/events/${event.event.id}">${event.event.title}</a><div>${event.date}<div><div>${category}</div>${edit_link}`;
  var latlon = [event.event.latitude, event.event.longitude]
  var marker = L.marker(latlon,{icon: markerIcon, alt: "event-marker"});
  marker.bindPopup(content).addTo(mymap).on('click',getPosition);
  markers.addLayer(marker);
});

var options = {
  geocoder: new L.Control.Geocoder.Nominatim()
};
L.Control.geocoder(options).addTo(mymap);



var popup = L.popup();

//地図クリックからイベント作成画面へのリンクを作成
function onMapClick(e) {
  mymap.flyTo([e.latlng.lat,e.latlng.lng], 16, { duration: 1 });
  popup.setLatLng(e.latlng).setContent(`<div><a data-remote="true" href="/events/new?latitude=${e.latlng.lat.toFixed(6)}&longitude=${e.latlng.lng.toFixed(6)}">この場所にイベントを投稿</a></div><div><a data-remote="true" href="/users/${gon.user_id}/mylocations/new?my_latitude=${e.latlng.lat.toFixed(6)}&my_longitude=${e.latlng.lng.toFixed(6)}">この場所にマイロケーションを作成</div>`).openOn(mymap);

  console.log(e.latlng.lat.toFixed(6));
  console.log(e.latlng.lng.toFixed(6));
}

mymap.on('click', onMapClick);

//モーダルの地図に位置情報を渡す
function getPosition(e){
  markerPosi = [e.latlng.lat.toFixed(6),e.latlng.lng.toFixed(6)]
};

//マイロケーション地点へ地図上を遷移
// function gotoMyloc(e){
//   alert( e )
// };
$('.gotoMyloc').on('click',function(e){
  // console.log(this.dataset.lat)
  let distination = [this.dataset.lat, this.dataset.lng]
  mymap.flyTo(distination, 14, { duration: 2 });
  popup.setLatLng(distination).setContent(`<div><a data-remote="true" href="/events/new?latitude=${this.dataset.lat}&longitude=${this.dataset.lng}">この場所にイベントを投稿</a></div>`).openOn(mymap)
})


mymap.addLayer(markers);
