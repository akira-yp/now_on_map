var sessionKey = sessionStorage.getItem('currentLat');
if( sessionKey == null ){
    default_latlng = [35.678362, 139.715387];
    default_zoom = 13;
  } else {
    default_latlng = [Number(sessionStorage.currentLat), Number(sessionStorage.currentLng)];
    default_zoom = Number(sessionStorage.currentZoom);
};

var mymap = L.map('mapid',{"tap":false}).setView(default_latlng, default_zoom);

L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}', { attribution: 'Tiles © <a href="http://www.esrij.com/"> Esri Japan </a>',
  maxZoom: 18,
  minZoom: 3,
}).addTo(mymap);

var markers = L.markerClusterGroup();

//
var markerIcon = L.icon({
  iconUrl: '/imgs/marker-pin.png',
  shadowUrl: '/imgs/marker-shadow.png',
  iconSize:[40,40],
  iconAnchor:[20,40],
  shoadowSize:[13,30],
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

//leafletの地名検索機能
var options = {
  geocoder: new L.Control.Geocoder.Nominatim(),
  expand: 'click',
  defaultMarkGeocode: false
};
L.Control.geocoder(options).on('markgeocode', function(e) {
    var marker = L.marker(e.geocode.center,{icon: markerIcon}).addTo(mymap);
    mymap.fitBounds(e.geocode.bbox);
  }).addTo(mymap);


var popup = L.popup();

//地図クリックからイベント作成画面へのリンクを作成
function onMapClick(e) {
  mymap.flyTo([e.latlng.lat,e.latlng.lng], 16, { duration: 1 });
  popup.setLatLng(e.latlng).setContent(`<div><a data-remote="true" href="/events/new?latitude=${e.latlng.lat.toFixed(6)}&longitude=${e.latlng.lng.toFixed(6)}">この場所にイベントを投稿</a></div><div><a data-remote="true" href="/users/${gon.user_id}/mylocations/new?my_latitude=${e.latlng.lat.toFixed(6)}&my_longitude=${e.latlng.lng.toFixed(6)}">この場所にマイロケーションを作成</div>`).openOn(mymap);
}

mymap.on('click', onMapClick);

//モーダルの地図に位置情報を渡す
function getPosition(e){
  markerPosi = [e.latlng.lat.toFixed(6),e.latlng.lng.toFixed(6)]
};

$('.event-card a').on('click',function(){
  var lat = $(this).data('lat');
  var lon = $(this).data('lon');
  markerPosi = [lat,lon];
});

//マイロケーション地点へ地図上を遷移
$('.gotoMyloc').on('click',function(e){
  // console.log(this.dataset.lat)
  let distination = [this.dataset.lat, this.dataset.lng]
  mymap.flyTo(distination, 14, { duration: 2 });
  popup.setLatLng(distination).setContent(`<div><a data-remote="true" href="/events/new?latitude=${this.dataset.lat}&longitude=${this.dataset.lng}">この場所にイベントを投稿</a></div>`).openOn(mymap)
})

//位置情報を保持
mymap.on('move', function(e){
  currentPosi = mymap.getCenter();
  currentZoom = mymap.getZoom();
  sessionStorage.setItem('currentLat',currentPosi.lat.toFixed(6));
  sessionStorage.setItem('currentLng',currentPosi.lng.toFixed(6));
  sessionStorage.setItem('currentZoom',currentZoom);
});

mymap.addLayer(markers);
