// mymap.addLayer(markers);

//クリック地点の座標を取得してポップアップする
var popup = L.popup();

function onMapClick(e) {
  mymap.flyTo([e.latlng.lat,e.latlng.lng], 18, { duration: 1 });
  popup.setLatLng(e.latlng).setContent(`<a data-remote="true" href="events/new?latitude=${e.latlng.lat}&longitude=${e.latlng.lng}">この場所にイベントを投稿</a>`).openOn(mymap);
}

mymap.on('click', onMapClick);
