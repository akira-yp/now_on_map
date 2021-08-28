// 現在地表示ボタン
var currentMarker = null; // 現在地マーカー
var currentWatchBtn = null;
L.easyButton('fas fa-street-view',function(btn, map){
	mymap.locate();
}).addTo(mymap);

var currentMarker = null;

function onLocationFound(e) {
  var currentIcon = L.icon({/* アイコン */
  			iconUrl: '/imgs/walkman.png',
  			iconRetinaUrl: '/imgs/walkman.png',
        iconSize: [32,32],
  			iconAnchor: [16, 16]
  		});
    currentMarker = L.marker(e.latlng,{icon : currentIcon }).addTo(mymap)
    mymap.setView(e.latlng,13);
}

function onLocationError(e) {
    alert("現在地を取得できませんでした。現在開発中によりSSL認証首藤までお待ちください");
}

mymap.on('locationfound', onLocationFound);
mymap.on('locationerror', onLocationError);
