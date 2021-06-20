
var mymap = L.map('mapid').setView([35.678362, 139.715387], 13);

L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>',
  maxZoom: 18,
  minZoom: 4,
}).addTo(mymap);

var centerIcon = L.icon({ //センタークロス表示用
  iconUrl: '/centermarker.png',
  iconSize: [48, 48],
  iconAnchor: [24, 48]
});

var centerMarker = L.marker( mymap.getCenter(),{icon:centerIcon,zIndexOffset:1000,interactive:false} ).addTo(mymap).bindPopup('<p>ここにイベントを投稿する</p>').openPopup();

mymap.on('move', function(e) {
    centerMarker.setLatLng(mymap.getCenter()); //センタークロス表示用
    //マップムーブイベントで値を出力
    outputPos(mymap);
  });

  //現在の緯度・経度・倍率を取得して指定の要素に情報を出力する関数
function outputPos(mymap){
  var pos = mymap.getCenter();
  document.getElementById('latitude').value = pos.lat.toFixed(6) ;
  document.getElementById('longitude').value = pos.lng.toFixed(6) ;
}
