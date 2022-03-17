import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final latitude;
  final longitude;
  final bool isReadyOnly;

  MapScreen({
    this.latitude = 37.419857,
    this.longitude = -122.078827,
    this.isReadyOnly = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  
  LatLng _pickedPosition;
  MapType _defaultMapType = MapType.normal;

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione...'),
        actions: <Widget>[
          if (!widget.isReadyOnly)
            IconButton(
              icon: Icon(Icons.check), 
              onPressed: _pickedPosition == null ? null : () {
                Navigator.of(context).pop(_pickedPosition);
              }
            )
        ],
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: _defaultMapType,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            
            initialCameraPosition: CameraPosition(
                target: LatLng(
                  widget.latitude, 
                  widget.longitude
                ), 
                zoom: 13
            ),
            onTap: widget.isReadyOnly ? null : _selectPosition,
            // markers: _selectPosition == null ? {} : {
            //   Marker(position: _pickedPosition, markerId: MarkerId("p1"))
            // },
          ),
          Container(
            margin: EdgeInsets.only(top: 80, right: 10),
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(Icons.layers),
                  elevation: 5,
                  backgroundColor: Colors.white,
                  onPressed: () {
                    _changeMapType();
                    print('Changing the Map Type');
                  }),
              ]),
          ),
        ],
      ),
    );
  }
}
