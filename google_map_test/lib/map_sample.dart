import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  _MapSampleState createState() => _MapSampleState();
}
 
class _MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
 
  CameraPosition _currentPosition = CameraPosition(
    target: LatLng(13.0827, 80.2707), //사용자 지정 좌표
    zoom: 12, //확대
  );
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: GoogleMap(
          initialCameraPosition: _currentPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete();
          },
        ),
      ),
    );
  }
}
