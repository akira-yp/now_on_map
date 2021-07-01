mymap.addLayer(markers);

//クリック地点の座標を取得してポップアップする
var popup = L.popup();

function onMapClick(e) {
    popup.setLatLng(e.latlng).setContent("You clicked the map at " + e.latlng.toString()).openOn(mymap);
}

mymap.on('click', onMapClick);
