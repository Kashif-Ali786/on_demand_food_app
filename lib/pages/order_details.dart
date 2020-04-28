import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:on_demand_food/constants.dart';
import 'package:on_demand_food/components/receipt.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:on_demand_food/modals/cart.dart';

CartManager cartManager = CartManager();

class OrderDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double verticleListHeight = 22;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Order Details'),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'Order ID: 5t36-83j4',
            ),
            subtitle: Text(
              'Wed, 12 Feb 2020',
            ),
            trailing: Text(
              '\$25.50',
            ),
          ),
          Divider(
            height: 0,
          ),
          ExpansionTile(
            leading: Icon(Icons.fastfood),
            title: Text('Order Items'),
            children: cartManager.getCartItemsList(),
          ),
          Divider(
            height: 0,
          ),
          ExpansionTile(
            leading: Icon(Icons.receipt),
            title: Text('Receipt'),
            children: <Widget>[
              Receipt(),
            ],
          ),
          Divider(
            height: 0,
          ),
          ExpansionTile(
            leading: Icon(Icons.timelapse),
            initiallyExpanded: true,
            title: Text('Track Order'),
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(
                          top: verticleListHeight,
                          bottom: verticleListHeight,
                        ),
                        width: 60,
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: generateSteps(done: false),
                            ),
                            Column(
                              children: generateSteps(),
                            ),
                            Column(
                              children: generateSteps(),
                            ),
                            Column(
                              children: generateSteps(),
                            ),
                            Column(
                              children: generateSteps(last: true),
                            ),
                          ],
                        )),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.only(
                                  top: verticleListHeight,
                                  bottom: verticleListHeight,
                                  right: 16),
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black54,
                                child: SvgPicture.asset(
                                    'images/icons/order-completed.svg'),
                              ),
                              title: Text('Order Completed'),
                              trailing: Text('10:04PM'),
                            ),
                            ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.only(
                                  top: verticleListHeight,
                                  bottom: verticleListHeight,
                                  right: 16),
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black54,
                                child: SvgPicture.asset(
                                    'images/icons/food-pickup.svg'),
                              ),
                              title: Text('Order Ready for Pickup'),
                              trailing: Text('10:04PM'),
                            ),
                            ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.only(
                                  top: verticleListHeight,
                                  bottom: verticleListHeight,
                                  right: 16),
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black54,
                                child: SvgPicture.asset(
                                    'images/icons/preparing-food.svg'),
                              ),
                              title: Text('Preparing Order'),
                              trailing: Text('10:04PM'),
                            ),
                            ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.only(
                                  top: verticleListHeight,
                                  bottom: verticleListHeight,
                                  right: 16),
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black54,
                                child: SvgPicture.asset(
                                    'images/icons/payment-success.svg'),
                              ),
                              title: Text('Received Payment'),
                              trailing: Text('10:04PM'),
                            ),
                            ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.only(
                                  top: verticleListHeight,
                                  bottom: verticleListHeight,
                                  right: 16),
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black54,
                                child: SvgPicture.asset(
                                    'images/icons/receipt.svg'),
                              ),
                              title: Text('Order Placed'),
                              trailing: Text('10:04PM'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 0,
          ),
          ListTile(
            isThreeLine: true,
            leading: Icon(Icons.home),
            title: Text('77 University Crescent'),
            subtitle: Text(
                'Apt 722 buzz 434. west building after passing first one.'),
          )
        ],
      ),
    );
  }
}

List<Widget> generateSteps({last = false, done = true}) {
  int length = 4;

  List<Widget> list = [];
  list.add(
    AvatarGlow(
      animate: !done ? true : false,
      endRadius: 24.0,
      glowColor: Colors.green,
      duration: Duration(milliseconds: 2000),
      repeat: !done ? true : false,
      showTwoGlows: true,
      repeatPauseDuration: Duration(milliseconds: 10),
      child: Material(
        elevation: 8.0,
        shape: CircleBorder(),
        child: CircleAvatar(
          radius: 12,
          foregroundColor: Colors.white,
          backgroundColor: done ? Colors.green[200] : Colors.green,
          child: done
              ? Icon(
                  Icons.check,
                  size: 18,
                )
              : null,
        ),
      ),
    ),
  );
  list.add(SizedBox(height: 5.5));
  if (!last)
    for (var i = 0; i < length; i++) {
      list.add(
        CircleAvatar(
          radius: 2,
          backgroundColor: Colors.grey,
        ),
      );
      list.add(SizedBox(height: 5.5));
    }
  return list;
}
