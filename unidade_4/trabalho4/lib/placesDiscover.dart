import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class placesDiscover extends StatefulWidget {
  placesDiscover();

  @override
  _placesDiscoverState createState() => _placesDiscoverState();
}

class _placesDiscoverState extends State<placesDiscover> {
  var latitude;
  var longitude;

  Future<void> _getCurrentLocation() async {
    final locData =  await Location().getLocation();

    setState(() {
      latitude = locData.latitude;
      longitude = locData.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getCurrentLocation();
    return Scaffold(
      appBar: AppBar(
        title: Text("Descobrir Lugares"),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,

            initialCameraPosition: CameraPosition(
              target: LatLng(
                latitude,
                longitude
              ),
              zoom: 13
            ),
          )
        ])
    );
  }
}
