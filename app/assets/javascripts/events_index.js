
var mymap = L.map('mapid').setView([35.678362, 139.715387], 13);

L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}', { attribution: 'Tiles © <a href="http://www.esrij.com/"> Esri Japan </a>',
  maxZoom: 18,
  minZoom: 3,
}).addTo(mymap);
// 'https://api.maptiler.com/maps/jp-mierune-gray/256/{z}/{x}/{y}.png?key=kQ7jEXOFcCTPC5D4Q9xX', {
//   attribution: '<a href="https://maptiler.jp/" target="_blank">&copy; MIERUNE</a> <a href="https://www.maptiler.com/copyright/" target="_blank">&copy; MapTiler</a> <a href="https://www.openstreetmap.org/copyright" target="_blank">&copy; OpenStreetMap contributors</a>',
//   maxZoom: 18,
//   minZoom: 4,
// }
//'http://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}', { attribution: 'Tiles © <a href="http://www.esrij.com/"> Esri Japan </a>' }
//'https://mt1.google.com/vt/lyrs=r&x={x}&y={y}&z={z}', {attribution: "<a href='https://developers.google.com/maps/documentation' target='_blank'>Google Map</a>"

var markers = L.markerClusterGroup();

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


//全画面表示
L.easyButton({
	states: [{
		stateName: 'full-screen',
		icon:	'fa-expand',
		title:	 '全画面',
		onClick: function(btn, map) {
			document.body.requestFullscreen();
			btn.state('full-screen-reset');
      $('#mapid').removeClass('map-index');
      $('#mapid').addClass('map-fullsize');
		}
	}, {
		stateName: 'full-screen-reset',
		icon:	'fa-compress',
		title:	 '元に戻す',
		onClick: function(btn, map) {
			document.exitFullscreen();
			btn.state('full-screen');
      $('#mapid').removeClass('map-fullsize');
      $('#mapid').addClass('map-index');
		}
	}]
}).addTo( mymap );

mymap.addLayer(markers);
