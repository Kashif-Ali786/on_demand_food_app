import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderTypes {
  final list = [
    {'name': 'Delivery', 'svg': 'images/icons/delivery.svg'},
    {'name': 'Pickup', 'svg': 'images/icons/pickup.svg'},
    {'name': 'DineIn', 'svg': 'images/icons/dinein.svg'},
  ];

  List<Widget> buildOrderTypesList(selectedIndex, callBack) {
    List<Widget> orderList = [];
    for (int i = 0; i < list.length; i++) {
      print('${list[i]['name']} =  ${i == selectedIndex}');
      orderList.add(ListTile(
          selected: i == selectedIndex,
          leading: SvgPicture.asset(
            list[i]['svg'],
            fit: BoxFit.contain,
            width: 60.0,
          ),
          title: Text(
            list[i]['name'],
            style: TextStyle(fontSize: 18),
          ),
          onTap: () => callBack(i)));
      //dont need divider for last item
      if (i + 1 != list.length) orderList.add(Divider());
    }
    return orderList;
  }
}
