
var mymap2 = L.map('mapid2').setView([35.678362, 139.715387], 13);

L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>',
  maxZoom: 18,
  minZoom: 4,
}).addTo(mymap2);

// var centerIcon = L.icon({
//   iconUrl: '/centermarker.png',
//   iconSize: [48, 48],
//   iconAnchor: [24, 48]
// });

var centerMarker = L.marker( mymap2.getCenter(),{zIndexOffset:3,interactive:false} ).addTo(mymap2).bindPopup('<p>イベントの設置位置を修正できます</p>').openPopup();

mymap2.on('move', function(e) {
    centerMarker.setLatLng(mymap2.getCenter()); //センタークロス表示用
    //マップムーブイベントで値を出力
    outputPos(mymap2);
  });

  //現在の緯度・経度・倍率を取得して指定の要素に情報を出力する関数
function outputPos(mymap2){
  var pos = mymap2.getCenter();
  document.getElementById('latitude').value = pos.lat.toFixed(6) ;
  document.getElementById('longitude').value = pos.lng.toFixed(6) ;
}
