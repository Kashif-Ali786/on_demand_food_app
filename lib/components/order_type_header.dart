import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:on_demand_food/constants.dart';
import 'package:on_demand_food/modals/order_types.dart';
import 'package:on_demand_food/pages/delivery_methods.dart';
import 'package:on_demand_food/state.dart';

final OrderTypes orderTypes = OrderTypes();

class OrderTypeHeader extends StatefulWidget {
  @override
  _OrderTypeHeaderState createState() => _OrderTypeHeaderState();
}

class _OrderTypeHeaderState extends State<OrderTypeHeader> {
  void _selectOrderType(index) {
    Provider.of<GlobalState>(context, listen: false)
        .setSelectedOrderMethod(index);
    Navigator.pop(context);
  }

  void viewOrderTypes(context, selectedIndex) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(12),
            height: 250,
            child: ListView(
                children: orderTypes.buildOrderTypesList(
                    selectedIndex, _selectOrderType)),
          );
        });
  }

  void handleDelivery(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          fullscreenDialog: Platform.isIOS ? true : false,
          builder: (context) {
            return DeliveryMethods();
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = Provider.of<GlobalState>(context).selectedOrderMethod;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            elevation: 8,
            color: kPrimaryColor,
            textColor: kButtonFontColor,
            onPressed: () => viewOrderTypes(context, selectedIndex),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'DeliveryImage',
                  child: SvgPicture.asset(
                    orderTypes.list[selectedIndex]['svg'],
                    width: 18,
                  ),
                ),
                SizedBox(width: 4),
                Text(orderTypes.list[selectedIndex]['name']),
                SizedBox(width: 4),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                )
              ],
            ),
          ),
          FlatButton(
            onPressed: () => handleDelivery(context),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 16,
                ),
                SizedBox(width: 4),
                Text('77 University Cres'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
