import 'package:flutter/material.dart';
import 'package:on_demand_food/components/searchbar.dart';
import 'package:on_demand_food/pages/google_map.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Location"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Searchbar(),
            Center(
              child: RaisedButton(
                color: Colors.green,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>GoogleMapClass()));
                },
                child: Text("Try Location"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
