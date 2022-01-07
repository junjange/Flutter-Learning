import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

const String kakaoMapKey = 'yourKey';


class KakaoMapTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // 화면 비율
    return Scaffold(
      appBar: AppBar(title: Text('Kakao map webview test')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          KakaoMapView(
              width: size.width,
              height: size.height -
                  AppBar()
                      .preferredSize
                      .height -
                  MediaQuery.of(context).padding.top,
              kakaoMapKey: kakaoMapKey,
              lat: 37.402056,
              lng: 127.108212,
              overlayText: "Dd",
              showMapTypeControl: true,
              showZoomControl: true,
              markerImageURL:
                  'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',

                  // JavaScript랑 연결???..
              customScript:  '''
              var markers = []; 
              function addMarker(position) {

      var marker = new kakao.maps.Marker({position: position});

      marker.setMap(map);

      markers.push(marker);
    }

    for(var i = 0 ; i < 3 ; i++){
      addMarker(new kakao.maps.LatLng(33.450701 + 0.0003 * i, 126.570667 + 0.0003 * i));

      kakao.maps.event.addListener(markers[i], 'click', function(){
        onTapMarker.postMessage('marker ' + i + ' is tapped');
     });
    }

		  var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      var mapTypeControl = new kakao.maps.MapTypeControl();
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);,
      
              ''',
              onTapMarker: (message) async {
                 ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message.message)));
                await _openKakaoMapScreen(context);
              }),
        ],
      ),
    );
  }

  Future<void> _openKakaoMapScreen(BuildContext context) async {
    KakaoMapUtil util = KakaoMapUtil();

    // String url = await util.getResolvedLink(
    //     util.getKakaoMapURL(37.402056, 127.108212, name: 'Kakao 본사'));

    /// This is short form of the above comment
    String url =
<<<<<<< HEAD
        await util.getMapScreenURL(37.402056, 127.108212, name: 'Kakao 본사');
=======
        await util.getMapScreenURL(33.450701, 126.570667, name: 'Kakao 본사');
>>>>>>> 906b5ed8130ea0be696fcc90d7425642e7516453

    Navigator.push(
        context, MaterialPageRoute(builder: (_) => KakaoMapScreen(url: url)));
  }
}
