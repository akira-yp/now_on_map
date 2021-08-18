//クリック地点の座標を取得してポップアップする
var popup = L.popup();

function onMapClick(e) {
  mymap.flyTo([e.latlng.lat,e.latlng.lng], 18, { duration: 0 });
  popup.setLatLng(e.latlng).setContent(`<div class="text-center" style="color:yellow;"><p>※イベント投稿にはログインが必要です</p><a href="/users/sign_in">ログインする</a><br><a href="/users/sign_up">アカウント登録する</a></div>`).openOn(mymap);
}

mymap.on('click', onMapClick);
