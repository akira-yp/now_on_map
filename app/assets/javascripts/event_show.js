
var mymap2 = L.map('mapid2').setView(markerPosi, 17);

L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}', { attribution: 'Tiles © <a href="http://www.esrij.com/"> Esri Japan </a>',
  maxZoom: 18,
  minZoom: 4,
}).addTo(mymap2);

var marker_show = L.marker(markerPosi,{icon: markerIcon});
marker_show.addTo(mymap2);
