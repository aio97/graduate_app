var map;
var markers = [];

function initMap() {

  var target = document.getElementById('target');
  var centerp = {lat: 35.6811673, lng: 139.7670516};

  map = new google.maps.Map(target, {
    center: centerp,
    zoom: 10,
  });

  // プランのlocationがnilでない場合にピンを立てる
  <% @book.plans.each do |plan| %>
    <% if plan.location.present? %>
      addMarker("<%= plan.location %>");
    <% end %>
  <% end %>
}

// 位置情報を元にマーカーを追加する関数
function addMarker(location) {
  var geocoder = new google.maps.Geocoder();
  
  geocoder.geocode({ address: location }, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      var latlng = results[0].geometry.location;
      setMarker(latlng);
      map.setCenter(latlng); // 最初のピンの位置にマップをセンター
    } else {
      console.error('場所が見つかりません: ' + status);
    }
  });
}

// マーカーを設定する関数
function setMarker(location) {
  var marker = new google.maps.Marker({
    position: location,
    map: map,
  });
  markers.push(marker); // マーカーを配列に追加
}

// マーカーをクリアする関数
function clearMarkers() {
  markers.forEach(marker => marker.setMap(null));
  markers = []; // 配列をクリア
}
