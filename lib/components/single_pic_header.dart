import 'package:flutter/material.dart';

class SinglePicHeader extends StatelessWidget {
  final imageURL;
  SinglePicHeader({this.imageURL});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Image.network(
            imageURL,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.white12])),
          )
        ],
      ),
    );
  }
}
