
var mymap3 = L.map('mapid3').setView(markerPosi, 13);

L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>',
  maxZoom: 18,
  minZoom: 4,
}).addTo(mymap3);

var markerIcon = L.icon({
  iconUrl: '/imgs/marker-pin.png',
  shadowUrl: '/imgs/marker-shadow.png',
  iconSize:[40,40],
  iconAnchor:[20,40],
  shoadowSize:[13,30],
  shadowAnchor:[13,40],
  popupAnchor: [0, -40]
});

 var centerMarker = L.marker( markerPosi,{icon: markerIcon, alt: "event-marker"}).addTo(mymap3);

mymap3.on('move', function(e) {
    centerMarker.setLatLng(mymap3.getCenter());
    outputPos(mymap3);
  });

  //現在の緯度・経度・倍率を取得して指定の要素に情報を出力する関数
function outputPos(mymap3){
  var pos = mymap3.getCenter();
  document.getElementById('latitude').value = pos.lat.toFixed(6) ;
  document.getElementById('longitude').value = pos.lng.toFixed(6) ;
}


$('#event-post-image').change(function(){
  $('.event-image').remove();
  var file = $(this).prop('files')[0];
  if(!file.type.match('image.*')){
    return;
  }
  var fileReader = new FileReader();
  fileReader.onloadend = function() {
    $('.current-image').html('<img src="' + fileReader.result + '" style="width:150px; height:150px; object-fit:cover;"/>');
    $('.choice-box').css('opacity','0');
  }
  fileReader.readAsDataURL(file);
});
