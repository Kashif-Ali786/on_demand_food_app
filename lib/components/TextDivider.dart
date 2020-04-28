import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(right: 20.0),
            child: Divider(
              color: Colors.black26,
              height: 36,
            )),
      ),
      Text(
        "OR",
        style: TextStyle(color: Colors.black26),
      ),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: Divider(
              color: Colors.black26,
              height: 36,
            )),
      ),
    ]);
  }
}
