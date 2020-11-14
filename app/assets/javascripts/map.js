function initMap(){
  // 現在地の取得
  var target = document.getElementById('map');
  var geocoder = new google.maps.Geocoder();
  var address = document.getElementById('sauna_name').textContent;
  geocoder.geocode({address: address}, function(results, status) {
    if (status === 'OK' && results[0]){
      //マップのインスタンスを変数に代入
       var map = new google.maps.Map(target, {
         center: results[0].geometry.location,
         zoom: 15
       });
      //マーカーの生成
      var marker = new google.maps.Marker({
        position: results[0].geometry.location,
        map: map,
        animation: google.maps.Animation.DROP
      });
      //情報ウィンドウの生成
      var infoWindow = new google.maps.InfoWindow({
        content: address,
        pixelOffset: new google.maps.Size(0, 5)
      });
      //マーカーにリスナーを設定
      marker.addListener('click', function(){
        infoWindow.open(map, marker);
      });
    }else{
      alert('失敗しました。理由: ' + status);
      return;
    }
  });
}