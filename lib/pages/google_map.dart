import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../state.dart';

class GoogleMapClass extends StatefulWidget {
  @override
  _GoogleMapClassState createState() => _GoogleMapClassState();
}

class _GoogleMapClassState extends State<GoogleMapClass> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;

  String searchAddress;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            onMapCreated: onMapCreated,

          ),
          Positioned(
            top: 30.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), color: Colors.white),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Enter Address',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: searchAndNavigate,
                        iconSize: 30.0)),
                onChanged: (val) {
                  setState(() {
                    searchAddress = val;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  searchAndNavigate() {
    Geolocator().placemarkFromAddress(searchAddress).then((result){
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(result[0].position.latitude, result[0].position.longitude),
          zoom: 10.0)));
    });
  }
  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}

