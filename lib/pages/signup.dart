import 'package:flutter/material.dart';
import 'package:on_demand_food/constants.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  signup() {}

  bool showPassword = false;

  toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  login(context) {
    Navigator.popUntil(context, ModalRoute.withName('/'));
    Navigator.pushReplacementNamed(
      context,
      '/home',
    );
  }

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
        title: Text('Sign Up'),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Name',
                      prefixIcon: Icon(Icons.person)),
                ),
                SizedBox(height: 24),
                TextField(
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Phone',
                      prefixIcon: Icon(Icons.phone_iphone)),
                ),
                SizedBox(height: 24),
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
                    onPressed: () => login(context),
                    child: Text('SIGN UP'),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 0,
                    runSpacing: 0,
                    runAlignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: <Widget>[
                      Text(
                        'By Signing up you agree with ',
                        style: TextStyle(fontSize: 12),
                      ),
                      RawMaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        constraints: BoxConstraints(minWidth: 0, minHeight: 0),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        onPressed: () => null,
                        child: Text(
                          'Terms of Service ',
                          style: TextStyle(color: kPrimaryColor, fontSize: 12),
                        ),
                      ),
                      Text(
                        '& ',
                        style: TextStyle(fontSize: 12),
                      ),
                      RawMaterialButton(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        constraints: BoxConstraints(minWidth: 0, minHeight: 0),
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        onPressed: () => null,
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(color: kPrimaryColor, fontSize: 12),
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
