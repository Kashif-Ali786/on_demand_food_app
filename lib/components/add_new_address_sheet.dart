import 'package:flutter/material.dart';
import 'package:on_demand_food/constants.dart';

showAddNewAddressBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(
              top: 16, bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Address',
                textAlign: TextAlign.center,
                style: kMainFontTextStyleLight,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
                child: TextField(
                  autofocus: true,
                  decoration:
                      InputDecoration(filled: true, labelText: 'Your Location'),
                ),
              ),
              SizedBox(height: 8),
              Container(
                  height: 60,
                  child: RaisedButton(
                      color: kPrimaryColor,
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Save',
                        style: kMainFontTextStyleDark,
                      )))
            ],
          )),
    ),
  );
}
