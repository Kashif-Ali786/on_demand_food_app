import 'package:flutter/material.dart';
import 'package:on_demand_food/constants.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  save(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Account'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  labelText: 'Current password',
                  prefixIcon: Icon(Icons.lock_outline),
                  filled: true),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  labelText: 'New password',
                  prefixIcon: Icon(Icons.lock),
                  filled: true),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  labelText: 'Confirm new password',
                  prefixIcon: Icon(Icons.lock),
                  filled: true),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: RaisedButton(
              colorBrightness: Brightness.dark,
              color: kPrimaryColor,
              onPressed: () => save(context),
              child: Text('SAVE'),
            ),
          ),
        ],
      ),
    );
  }
}
