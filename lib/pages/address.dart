import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:place_picker/place_picker.dart';

class GoogleMapClass extends StatefulWidget {
  @override
  _GoogleMapClassState createState() => _GoogleMapClassState();
}

class _GoogleMapClassState extends State<GoogleMapClass> {
  GoogleMapController mapController;
  static const kGoogleApiKey = "AIzaSyAiFxsvyov7maJXKNHWfOT0-h0JgDwVfMo";

  String searchAddress;
  static var _initialPosition = LatLng(30.3753, 69.3451);
  final Set<Marker> markers = {};
  PlacePicker p;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 5.4746,
            ),
            onMapCreated: onMapCreated,
            compassEnabled: true,
            markers: markers,
          ),
          Positioned(
            top: 30.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: TextField(
                onTap: () async {
                  Prediction p = await PlacesAutocomplete.show(
                      context: context,
                      apiKey: kGoogleApiKey,
                      overlayBorderRadius: BorderRadius.circular(20),

                      language: "en",
                      components: [Component(Component.country, "pk")]);
                  searchAddress = p.description;
                  searchAndNavigate();
                },
                decoration: InputDecoration(
                    hintText: 'Enter Address',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 30.0)),
              ),
            ),
          )
        ],
      ),
    );
  }

  searchAndNavigate() {
    Geolocator().placemarkFromAddress(searchAddress).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(result[0].position.latitude, result[0].position.longitude),
          zoom: 17.0)));
      //get longitude and latitude for position
      _initialPosition = LatLng(result[0].position.latitude, result[0].position.longitude);
      addMarker(_initialPosition);
      });
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }

  void addMarker(LatLng initialPosition) {
    setState(() {
      markers.add(Marker(markerId: MarkerId(initialPosition.toString()),
          position: _initialPosition, infoWindow: InfoWindow(title: "Remember here",snippet: "good place")));
    });

  }

//  Future<Null> showDetailPlace(String placeId) async {
//    if (placeId != null) {
//      Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => PlaceDetailWidget(placeId)),
//      );
//    }
//  }

}

///**********For dry run to check id********///////

//class PlaceDetailWidget extends StatelessWidget {
//  String id;
//  PlaceDetailWidget(this.id);
//  @override
//  Widget build(BuildContext context) {
//    return Center(child: Text("$id"));
//  }
//}
