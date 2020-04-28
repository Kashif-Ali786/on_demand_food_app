import 'package:flutter/material.dart';
import 'package:on_demand_food/constants.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
          EditImage(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.account_circle),
                  filled: true),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Phone',
                  prefixIcon: Icon(Icons.phone_iphone),
                  filled: true),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
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

class EditImage extends StatelessWidget {
  const EditImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      alignment: Alignment.center,
      child: CircleAvatar(
        radius: 80,
        backgroundImage: AssetImage('images/profile.png'),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 12)],
                color: kPrimaryColor,
                shape: BoxShape.circle),
            child: IconButton(
              onPressed: () => null,
              icon: Icon(Icons.edit),
            ),
          ),
        ),
      ),
    );
  }
}
