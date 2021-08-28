// 現在地表示ボタン
var currentMarker = null; // 現在地マーカー
var currentWatchBtn = null;
L.easyButton({ // 現在地表示ボタン
	states: [{
		stateName: 'current-watch',
		icon:	'fas fa-street-view',
		title:	 '現在地',
    tap:false,
		onClick: function(btn, map) {
			mymap.locate();
			btn.state('current-watch-reset');
			currentWatchBtn = btn;
		}
	}, {
		stateName: 'current-watch-reset',
		icon:	'fa fa-map-marker-alt',
		title:	 '現在地オフ',
    tap:false,
		onClick: function(btn, map) {
      mymap.removeLayer(currentMarker);
			btn.state('current-watch');
		}
	}]
}).addTo( mymap );

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
    console.log("現在地を取得できませんでした。" + e.message);
}

mymap.on('locationfound', onLocationFound);
mymap.on('locationerror', onLocationError);
