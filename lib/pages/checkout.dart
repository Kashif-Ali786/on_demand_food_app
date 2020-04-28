import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:on_demand_food/constants.dart';
import 'package:on_demand_food/modals/order_types.dart';
import 'package:on_demand_food/state.dart';
import 'order_details.dart';
import 'package:on_demand_food/components/receipt.dart';

final OrderTypes orderTypes = OrderTypes();

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final String storeName = 'A&W Burgers';

  final String storeAddress = '393 Portage Ave. #232B, Winnipeg MB, R3T 3N8';

  final String dateTime = 'ASAP (15 - 30 mins)';

  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text = '1.50';
  }

  checkTipVal({value = 0}) {
    print(value);
  }

  pay(context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => OrderDetail()),
      ModalRoute.withName('/home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orderTypeMethod = orderTypes
        .list[Provider.of<GlobalState>(context).selectedOrderMethod]['name'];

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).canvasColor,
            brightness: Brightness.light,
            iconTheme: ThemeData.light().iconTheme,
            textTheme: ThemeData.light().textTheme,
            title: Text(
              'Checkout',
              style: kMainFontTextStyleLight,
            )),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${orderTypeMethod} Details',
                          style: kMainFontTextStyleLightBold,
                        ),
                        RawMaterialButton(
                          constraints: BoxConstraints(minWidth: 0),
                          padding: EdgeInsets.all(0),
                          onPressed: () => null,
                          child: Text(
                            'Edit',
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  ),
                  SwitchListTile(
                    secondary: Icon(Icons.repeat),
                    activeColor: kPrimaryColor,
                    title: Text('Repeat Order'),
                    onChanged: (value) => null,
                    value: true,
                  ),
                  ListTile(
                    leading: Icon(Icons.access_time),
                    title: Text(dateTime),
                  ),
                  ListTile(
                    leading: Icon(Icons.store),
                    title: Text(storeName),
                    subtitle: Text(storeAddress),
                  ),
                  Divider(
                    thickness: 4,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 8, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Instructions',
                          style: kMainFontTextStyleLightBold,
                        ),
                        SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              filled: true,
                              hintText:
                                  'Special instructions buzz code or apt # etc'),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 4,
                  ),
                  ListTile(
                    title: Text(
                      'Tip Your Courier',
                    ),
                    subtitle: Text('100% of your tip goes to your courier.'),
                    trailing: Container(
                      width: 85,
                      height: 40,
                      child: TextField(
                        onChanged: (value) => checkTipVal(value: value),
                        keyboardType: TextInputType.number,
                        controller: _textController,
                        decoration: InputDecoration(
                          filled: true,
                          prefixText: '\$',
                        ),
                      ),
                    ),
                  ),
                  Receipt(),
                  ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text('**5779'),
                    trailing: RawMaterialButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () => null,
                      constraints: BoxConstraints(minWidth: 0),
                      child: Text(
                        'CHANGE',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    child: RaisedButton(
                      onPressed: () => pay(context),
                      color: kPrimaryColor,
                      child: Text('Pay', style: kMainFontTextStyleDark),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
