import 'package:flutter/material.dart';
import 'package:on_demand_food/constants.dart';
import 'package:on_demand_food/components/TextDivider.dart';
import 'package:on_demand_food/components/CompanyButton.dart';
import 'package:on_demand_food/pages/signup.dart';

class CreateAccount extends StatelessWidget {
  toLoginPage(context) {
    Navigator.pop(context);
  }

  toSignUpPage(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 48),
                Text(
                  'New Account',
                  style: Theme.of(context).textTheme.display3,
                ),
                SizedBox(height: 32),
                Container(
                  height: 50,
                  child: CompanyButton(
                    companyName: 'facebook',
                    onPressed: () => toSignUpPage(context),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 50,
                  child: CompanyButton(
                    companyName: 'google',
                    onPressed: () => toSignUpPage(context),
                  ),
                ),
                SizedBox(height: 32),
                TextDivider(),
                SizedBox(height: 32),
                Container(
                  height: 50,
                  child: RaisedButton(
                    colorBrightness: Brightness.light,
                    color: Colors.white,
                    onPressed: () => toSignUpPage(context),
                    child: Text('SIGN UP WITH EMAIL'),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Already Have An Account?'),
                      RawMaterialButton(
                        constraints: BoxConstraints(minWidth: 0),
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        onPressed: () => toLoginPage(context),
                        child: Text(
                          'Log In',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
