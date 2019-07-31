import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapTab extends StatelessWidget {
  GoogleMapController mapController;



  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  var location = new Location();


  final LatLng _center = const LatLng(46, 32);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          zoomGesturesEnabled: true,
          myLocationEnabled: true,
        ),
      ),
    );
  }
}