var storage = JSON.parse(sessionStorage.getItem('mymapStatus'));
var defaultLatlng = storage ? [+storage.currentLat, +storage.currentLng] : [35.678362, 139.715387];
var defaultZoom = storage ? +storage.currentZoom : 13;

var mymap = L.map('mapid',{"tap":false}).setView(defaultLatlng, defaultZoom);

L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}', { attribution: 'Tiles © <a href="http://www.esrij.com/"> Esri Japan </a>',
  maxZoom: 18,
  minZoom: 3,
}).addTo(mymap);

var markers = L.markerClusterGroup();

//マーカーアイコンを設定
var markerIcon = L.icon({
  iconUrl: '/imgs/marker-pin.png',
  shadowUrl: '/imgs/marker-shadow.png',
  iconSize:[40,40],
  iconAnchor:[20,40],
  shoadowSize:[13,30],
  shadowAnchor:[13,40],
  popupAnchor: [0, -40]
});

//ポップアップ作成
gon.events.forEach((event) => {
  var category = event.categories.reduce((html,cat) => html + `<span class="category cat-in-popup">${cat}</span>`,`` );
  var content = `<a data-remote="true" href="/events/${event.event.id}"  class="event-title" >${event.event.title}</a><div>${event.date}<div><div>${category}</div>`;
  var latlon = [event.event.latitude, event.event.longitude];
  var marker = L.marker(latlon,{icon: markerIcon, alt: "event-marker"}).bindPopup(content).addTo(mymap);
  if (event.countdate !== ""){
    marker.bindTooltip(`あと${event.countdate}日で終了`,{permanent:true}).openTooltip().addTo(mymap);
  }
  marker.on('click',getPosition);
  markers.addLayer(marker);
});

//モーダルの地図に位置情報を渡す
function getPosition(e){
  markerPosi = [e.latlng.lat.toFixed(6),e.latlng.lng.toFixed(6)]
};

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


//end_date_gteq_allに検索と同じ値を設定
let startform = document.getElementById('q_start_date_lteq_all');
let endform = document.getElementById('q_end_date_gteq_all');
function inputChange(){
  startform.value = startform.value;
  endform.value = startform.value;
}

startform.addEventListener('input', inputChange);


//mapを移動した場合に座標情報を保持
mymap.on('move', function(e){
  currentPosi = mymap.getCenter();
  sessionStorage.setItem('mymapStatus', JSON.stringify({
    currentLat : currentPosi.lat.toFixed(6),
    currentLng : currentPosi.lng.toFixed(6),
    currentZoom: mymap.getZoom(),
  }));
});


//全画面表示
var expandbtn = L.easyButton({
	states: [{
		stateName: 'full-screen',
		icon:'fa-expand',
		title:'全画面',
    tap:false,
		onClick: function(btn, map) {
			btn.state('full-screen-reset');
      $('#mapid').removeClass('map-index');
      $('#mapid').addClass('map-fullsize');
      $('.space-cols').addClass('fix-bottom');
      $('.close-search-btn').addClass('open btn-fixed');
      sessionStorage.setItem('mapsize','map-fullsize');
		}
	}, {
		stateName: 'full-screen-reset',
		icon:'fa-compress',
		title:'元に戻す',
    tap:false,
		onClick: function(btn, map) {
			btn.state('full-screen');
      $('#mapid').removeClass('map-fullsize');
      $('#mapid').addClass('map-index');
      $('.space-cols').removeClass('fix-bottom');
      $('.close-search-btn').removeClass('open btn-fixed');
      sessionStorage.setItem('mapsize','map-index');
		}
	}]
});
expandbtn.addTo( mymap );

//サーチフォームの表示・非表示
$('.close-search-btn').on('click',function(){
  $(this).toggleClass('fa-times-circle');
  $(this).toggleClass('fa-search-location');
  $(this).toggleClass('btn-fixed');
  $('.fix-bottom').toggleClass('present');
})

mymap.addLayer(markers);
