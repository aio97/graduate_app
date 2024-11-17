var MyLatLng = new google.maps.LatLng(35.65871995583428, 139.7454221687028); //座標を指定
var Options = {
    zoom: 15, //地図の縮尺値を指定
    center: MyLatLng, //地図の中心座標
    mapTypeId: 'roadmap' //地図の種類を指定
};
var map = new google.maps.Map(document.getElementById('google_map'), Options); //埋め込むMAPのidを指定
