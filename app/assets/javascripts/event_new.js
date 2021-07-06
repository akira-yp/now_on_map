// mymap.addLayer(markers);

//クリック地点の座標を取得してポップアップする
var popup = L.popup();

function onMapClick(e) {
  console.log(e.latlng.lat);
  console.log(e.latlng.lng);
  // console.log(e.latlng.lng);
  // let latlngArr = e.latlng.lat;
  // let newlat = latlngArr[0];
  // let newlng = latlngArr[1];
  popup.setLatLng(e.latlng).setContent('<a href="events/new">この場所にイベントを投稿</a>'+ e.latlng.toString()).openOn(mymap);
}



mymap.on('click', onMapClick);
