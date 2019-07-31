import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';

class MapTab extends StatelessWidget {
  GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();

  var location = new Location();

  final LatLng _center = const LatLng(46, 32);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          zoomGesturesEnabled: true,
          myLocationEnabled: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _currentLocation,
          label: Text('button'),
          icon: Icon(Icons.location_on),
        ),
      ),
    );
  }



  void _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    LocationData currentLocation;
    var location = new Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 17.0,
      ),
    ));
  }
}
