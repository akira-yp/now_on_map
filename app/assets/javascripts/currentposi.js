// 現在地表示ボタン
var currentMarker = null;
var currentWatchBtn = null;
L.easyButton('fas fa-street-view',function(btn, map){
  mymap.setView(currentLatLng, 16);
	// mymap.locate({ setVeiw: true, });
}).addTo(mymap);

function onLocationFound(e) {
  var currentIcon = L.icon({
  			iconUrl: '/imgs/walkman.png',
  			iconRetinaUrl: '/imgs/walkman.png',
        iconSize: [32,32],
  			iconAnchor: [16, 16]
  		});
    currentMarker = L.marker(e.latlng,{icon : currentIcon }).addTo(mymap)
    currentLatLng = e.latlng
}

function onLocationError(e) {
    alert("現在地を取得できませんでした。" + e.message);
}

mymap.on('locationfound', onLocationFound);
mymap.on('locationerror', onLocationError);
mymap.locate({setView: false, timeout: 20000})
