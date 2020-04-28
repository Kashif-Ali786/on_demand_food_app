import 'package:flutter/material.dart';

class CompanyButton extends StatelessWidget {
  final Function onPressed;
  final String companyName;

  CompanyButton({
    @required this.companyName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0.5,
      color: Colors.white,
      colorBrightness: Brightness.light,
      onPressed: () => onPressed(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/icons/$companyName.png',
            height: 40,
            width: 40,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 12),
          Text('CONTINUE WITH ${companyName.toUpperCase()}'),
        ],
      ),
    );
  }
}
