// 現在地表示ボタン
var currentMarker = null;
var currentButton = L.easyButton(
  'fas fa-street-view',function(btn, map){
	mymap.locate({ setVeiw: true, });
}).addTo(mymap);

function openPopup(){
  this.openPopup();
}

function onLocationFound(e) {
  var currentIcon = L.icon({
  			iconUrl: '/imgs/walkman.png',
  			iconRetinaUrl: '/imgs/walkman.png',
        iconSize: [32,32],
  			iconAnchor: [16, 16]
  		});
    currentMarker = L.marker(e.latlng,{icon : currentIcon })
                      .bindPopup("現在地")
                      .addTo(mymap)
                      .on('mouseover',openPopup);
    mymap.setView(e.latlng, 16);
}

function onLocationError(e) {
    alert("現在地を取得できませんでした。" + e.message);
}

mymap.on('locationfound', onLocationFound);
mymap.on('locationerror', onLocationError);
// mymap.locate({setView: false, timeout: 20000})
