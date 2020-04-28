import 'package:flutter/material.dart';

Container Categories() {
  return Container(
    height: 100.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Category(
            'http://terachef.com/images/food-category/arabic.png', 'Arabic'),
        Category(
            'http://terachef.com/images/food-category/chinese.png', 'Chinese'),
        Category(
            'http://terachef.com/images/food-category/italian.png', 'Italian'),
        Category('http://terachef.com/images/food-category/medet.png',
            'Mediterranean'),
        Category('images/category/desi.png', 'Indian', network: false),
      ],
    ),
  );
}

Widget Category(image, name, {network = true}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
    child: Column(
      children: <Widget>[
        if (network)
          Image.network(image, height: 70.0, width: 70.0, fit: BoxFit.contain)
        else
          Image.asset(image, height: 70.0, width: 70.0, fit: BoxFit.contain),
        SizedBox(
          height: 4,
        ),
        Text(name)
      ],
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
    ),
  );
}
