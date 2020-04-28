import 'package:flutter/material.dart';
import 'package:on_demand_food/constants.dart';

class ResetPassword extends StatelessWidget {
  reset() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        textTheme: ThemeData.light()
            .textTheme
            .copyWith(title: kMainFontTextStyleLight),
        iconTheme: ThemeData.light().iconTheme,
        title: Text('Reset Password'),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'To reset your password, enter the email you use to login to your account.',
              ),
              SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 32),
              Container(
                height: 50,
                child: RaisedButton(
                  onPressed: reset,
                  colorBrightness: Brightness.dark,
                  color: kPrimaryColor,
                  child: Text('RESET PASSWORD'),
                ),
              )
            ],
          )),
    );
  }
}
