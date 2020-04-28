import 'package:flutter/material.dart';

class MultiplePicsHeader extends StatefulWidget {
  @override
  _MultiplePicsHeaderState createState() => _MultiplePicsHeaderState();
}

class _MultiplePicsHeaderState extends State<MultiplePicsHeader> {
  final listImageHeader = [
    'images/items/header_1.jpg',
    'images/items/header_2.jpg',
    'images/items/header_3.jpg',
    'images/items/header_4.jpg',
  ];
  int _indexHeader = 0;

  @override
  Widget build(BuildContext context) {
    //var mediaQuery = MediaQuery.of(context);
    return Container(
      child: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (context, index) {
              return Image.asset(
                listImageHeader[index],
                fit: BoxFit.cover,
              );
            },
            itemCount: listImageHeader.length,
            onPageChanged: (index) {
              setState(() {
                _indexHeader = index;
              });
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < listImageHeader.length; i++)
                    if (i == _indexHeader)
                      circleBar(true)
                    else
                      circleBar(false),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 16 : 12,
      width: isActive ? 16 : 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: isActive ? Border.all(color: Colors.white) : null,
      ),
      padding: EdgeInsets.all(isActive ? 4.0 : 0.0),
      child: Container(
        width: isActive ? 8 : 16,
        height: isActive ? 8 : 16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
        ),
      ),
    );
  }
}
