import 'package:flutter/material.dart';
import 'package:on_demand_food/pages/checkout.dart';
import 'package:on_demand_food/constants.dart';
import 'package:on_demand_food/global_navigator.dart';

class Cart extends StatelessWidget {
  final double total;
  final String storeName;
  final List items;

  Cart({this.storeName, this.total = 0, this.items});

  toCheckoutPage() {
    navigatorKey.currentState
        .push(MaterialPageRoute(builder: (context) => Checkout()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).canvasColor,
          brightness: Brightness.light,
          iconTheme: ThemeData.light().iconTheme,
          textTheme: ThemeData.light().textTheme,
          title: Text(
            '$storeName',
            style: kMainFontTextStyleLight,
          )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
              title: Text(
                'Food & Beverage Subtotal',
                style: kMainFontTextStyleLight,
              ),
              trailing: Text(
                '\$${total.toStringAsFixed(2)}',
                style: kMainFontTextStyleLight,
              ),
            ),
            Expanded(
              child: RaisedButton(
                color: kPrimaryColor,
                onPressed: () => toCheckoutPage(),
                child: Text(
                  'Continue',
                  style: kMainFontTextStyleDark,
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(
                'Items',
                style: Theme.of(context).textTheme.headline,
              ),
              trailing: RaisedButton(
                colorBrightness: Brightness.dark,
                onPressed: () => null,
                color: kPrimaryColor,
                child: Text('Add Items'),
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: createItemsList(items),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

createItemsList(List items) {
  List<Widget> list = [];
  for (int i = 0; i < items.length; i++) {
    var item = items[i];
    list.add(
      ListTile(
        dense: false,
        isThreeLine: item['options'].length != 0 ? true : false,
        leading: Text('${item['quantity']}', style: kMainFontTextStyleLight),
        title: Text(item['name'], style: kMainFontTextStyleLight),
        trailing: Text('\$${item['total'].toStringAsFixed(2)}',
            style: kMainFontTextStyleLight),
        subtitle: item['options'].length != 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: item['options']
                    .map<Text>(
                      (option) => Text(option['cost'] > 0
                          ? '${option['name']} + \$${option['cost'].toStringAsFixed(2)}'
                          : '${option['name']}'),
                    )
                    .toList(),
              )
            : null,
      ),
    );
    if (i + 1 != items.length) list.add(Divider());
  }
  return list;
}
