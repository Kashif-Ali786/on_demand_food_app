import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:on_demand_food/constants.dart';
import 'package:on_demand_food/global_navigator.dart';

import 'item_desc.dart';

class MenuItem extends StatelessWidget {
  final String imageURL;
  final String name;
  final String description;
  final double price;

  MenuItem({
    this.name,
    this.description,
    this.price,
    this.imageURL = null,
  });

  viewItem(context) {
    navigatorKey.currentState.push(MaterialPageRoute(
      builder: (context) => ItemDesc(
        name: name,
        price: price,
        description: description,
        imageURL: imageURL,
      ),
      fullscreenDialog: Platform.isIOS ? true : false,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => viewItem(context),
      trailing: imageURL != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageURL,
                fit: BoxFit.cover,
              ),
            )
          : null,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
          SizedBox(
            height: 6.0,
          ),
          Text(description, style: kSubtitleFontTextStyleLight),
          SizedBox(
            height: 6.0,
          ),
          Text('\$${price.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18))
        ],
      ),
    );
  }
}
