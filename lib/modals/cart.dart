import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:on_demand_food/components/cart.dart';
import 'package:on_demand_food/constants.dart';
import 'package:on_demand_food/global_navigator.dart';

const List items = [
  {
    'name': 'Hot Wings',
    'total': 12.50,
    'quantity': 1,
    'options': [
      {'name': 'Extra Hot', 'cost': 0},
      {'name': 'Extra Bread', 'cost': 1.00},
    ]
  },
  {
    'name': 'Hot Wings',
    'total': 12.50,
    'quantity': 1,
    'options': [
      {'name': 'Hot Wings', 'cost': 0},
      {'name': 'Extra Hot', 'cost': 0},
      {'name': 'Extra Rice', 'cost': 1.50},
      {'name': 'Extra Bread', 'cost': 1.00},
    ]
  },
  {
    'name': 'Hot Wings',
    'total': 12.50,
    'quantity': 1,
    'options': [
      {'name': 'Hot Wings', 'cost': 0},
      {'name': 'Extra Hot', 'cost': 0},
      {'name': 'Extra Rice', 'cost': 1.50},
      {'name': 'Extra Bread', 'cost': 1.00},
    ]
  },
  {
    'name': 'Hot Wings',
    'total': 12.50,
    'quantity': 1,
    'options': [
      {'name': 'Hot Wings', 'cost': 0},
      {'name': 'Extra Hot', 'cost': 0},
      {'name': 'Extra Rice', 'cost': 1.50},
      {'name': 'Extra Bread', 'cost': 1.00},
    ]
  },
  {
    'name': 'Hot Wings',
    'total': 12.50,
    'quantity': 1,
    'options': [
      {'name': 'Hot Wings', 'cost': 0},
      {'name': 'Extra Hot', 'cost': 0},
      {'name': 'Extra Rice', 'cost': 1.50},
      {'name': 'Extra Bread', 'cost': 1.00},
    ]
  },
  {'name': 'Hot Wings', 'total': 12.50, 'quantity': 1, 'options': []},
  {
    'name': 'Hot Wings',
    'total': 12.50,
    'quantity': 1,
    'options': [
      {'name': 'Extra Rice', 'cost': 1.50},
      {'name': 'Extra Bread', 'cost': 1.00},
    ]
  }
];

class CartManager {
  getBottomCart() {
    return CartButton();
  }

  getCartItemsList() {
    return createItemsList(items);
  }
}

class CartButton extends StatelessWidget {
  showCart(context) {
    navigatorKey.currentState.push(MaterialPageRoute(
        fullscreenDialog: Platform.isIOS ? true : false,
        builder: (context) =>
            Cart(storeName: 'A&W Burgers', total: 24.50, items: items)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: RaisedButton(
        color: kPrimaryColor,
        onPressed: () => showCart(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Text('1')),
                ],
              ),
            ),
            Text('View Cart', style: kMainFontTextStyleDark),
            Container(
              alignment: Alignment.center,
              width: 100,
              child: Text('\$24.50', style: kMainFontTextStyleDark),
            ),
          ],
        ),
      ),
    );
  }
}
