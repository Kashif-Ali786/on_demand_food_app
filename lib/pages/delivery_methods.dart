import 'package:flutter/material.dart';
import 'package:on_demand_food/constants.dart';

class DeliveryMethods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
          textTheme: TextTheme(title: kMainFontTextStyleLight),
          iconTheme: IconThemeData(color: kFontColor),
          backgroundColor: kBackgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Delivery Details')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                    title: Text(
                  'When',
                  style: kMainFontTextStyleLight,
                )),
                ListTile(
                  selected: true,
                  leading: Icon(Icons.timer),
                  title: Text('As soon as possible'),
                  trailing: Icon(Icons.check),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.date_range),
                  title: Text('Schedule order'),
                ),
                Divider(
                  thickness: 6,
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: (Text('Enter new address')),
                ),
                Divider(
                  thickness: 6,
                ),
                ListTile(
                  selected: true,
                  leading: Icon(Icons.access_time),
                  title: Text('77 Universty Cres'),
                  subtitle: Text('Winnipeg, MB'),
                  trailing: Icon(Icons.check),
                ),
                Divider(),
                ListTile(
                  selected: false,
                  leading: Icon(Icons.access_time),
                  title: Text('33 Blue Wing Pl'),
                  subtitle: Text('Winnipeg, MB'),
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            child: FlatButton(
              color: kPrimaryColor,
              child: Text(
                'Save',
                style: kButtonFontTextStyleDark,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          )
        ],
      ),
    );
    ;
  }
}
