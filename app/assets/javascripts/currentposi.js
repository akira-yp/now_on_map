// 現在地表示ボタン
var currentMarker = null; // 現在地マーカー
var currentWatchBtn = null;
L.easyButton('fas fa-street-view',function(btn, map){
  mymap.setView(currentLatLng, 16);
	// mymap.locate({ setVeiw: true, });
}).addTo(mymap);

function onLocationFound(e) {
  var currentIcon = L.icon({/* アイコン */
  			iconUrl: '/imgs/walkman.png',
  			iconRetinaUrl: '/imgs/walkman.png',
        iconSize: [32,32],
  			iconAnchor: [16, 16]
  		});
    currentMarker = L.marker(e.latlng,{icon : currentIcon }).addTo(mymap)
    currentLatLng = e.latlng
    // mymap.setView(e.latlng,13);
}

function onLocationError(e) {
    alert("現在地を取得できませんでした。" + e.message);
}

mymap.on('locationfound', onLocationFound);
mymap.on('locationerror', onLocationError);
mymap.locate({setView: false, timeout: 20000})
