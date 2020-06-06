import 'package:flutter/material.dart';
import 'package:on_demand_food/constants.dart';
import 'package:on_demand_food/pages/address.dart';
import 'package:on_demand_food/pages/reset_password.dart';
import 'package:on_demand_food/pages/create_account.dart';
import 'package:on_demand_food/components/TextDivider.dart';
import 'package:on_demand_food/components/CompanyButton.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  login(context) {
    Navigator.pushReplacementNamed(context, '/address');
  }
  bool showPassword = false;

  toSearchLocation(context)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>GoogleMapClass()));
  }

  toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  toResetPasswordPage(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ResetPassword()));
  }

  toCreateAccountPage(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CreateAccount()));
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
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.display3,
                ),
                SizedBox(height: 32),
                Container(
                  height: 50,
                  child: CompanyButton(
                    companyName: 'facebook',
                    onPressed: login,
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 50,
                  child: CompanyButton(
                    companyName: 'google',
                    onPressed: login,
                  ),
                ),
                SizedBox(height: 32),
                TextDivider(),
                SizedBox(height: 32),
                TextField(
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email)),
                ),
                SizedBox(height: 24),
                TextField(
                  textAlignVertical: TextAlignVertical.center,
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: RawMaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        constraints: BoxConstraints(minHeight: 0, minWidth: 0),
                        padding: EdgeInsets.zero,
                        onPressed: () => toggleShowPassword(),
                        child: Icon(
                          Icons.remove_red_eye,
                          color: showPassword ? kPrimaryColor : Colors.grey,
                        ),
                      )),
                ),
                SizedBox(height: 32),
                Container(
                  height: 50,
                  child: RaisedButton(
                    colorBrightness: Brightness.dark,
                    color: kPrimaryColor,
                    onPressed: () => toSearchLocation(context),
                    child: Text('LOG IN'),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  child: MaterialButton(
                    onPressed: () => toResetPasswordPage(context),
                    child: Text(
                      'Recover Password?',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Need An Account?'),
                      RawMaterialButton(
                        constraints: BoxConstraints(minWidth: 0),
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        onPressed: () => toCreateAccountPage(context),
                        child: Text(
                          'Sign Up',
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
