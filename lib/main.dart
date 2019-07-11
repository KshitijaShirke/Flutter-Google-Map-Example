import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MapExample());

class MapExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: MyApp(),);
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Marker> allMarkers=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMarkers.add(
        Marker(
            markerId: MarkerId('MyMarker'),
            draggable: false,
            onTap: (){
              print("Marker Tapped");
            },
            position:LatLng(19.0760, 72.8777),
            infoWindow: InfoWindow(
              title: "Mazi Mumbai",
              snippet: "City In Maharashtra",
            ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Map Example"),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(19.0760, 72.8777),
                  zoom: 12.0
              ),
              markers: Set.from(allMarkers),
          ),
        ),
      ),
    );
  }
}