import 'package:flutter/material.dart';
import 'package:on_demand_food/constants.dart';

class AccountPage extends StatelessWidget {
  handleTap() {
    print('clicked');
  }

  toPage(context, {pageName}) {
    Navigator.pushNamed(context, '/$pageName');
  }

  logout(context) =>
      Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName('/'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 8),
                  ListTile(
                    isThreeLine: true,
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 30,
                      backgroundImage: AssetImage(
                        'images/profile.png',
                      ),
                    ),
                    title: Text(
                      'Hassan Ahmed',
                      style: kMainFontTextStyleLight,
                    ),
                    subtitle: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '2045907230',
                          style: kSubtitleFontTextStyleLight,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'haiderkiki@gmail.com',
                          style: kSubtitleFontTextStyleLight,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  ListTile(
                    onTap: () => toPage(context, pageName: 'edit_profile'),
                    leading: Icon(Icons.edit),
                    title: Text('Edit Account'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () => toPage(context, pageName: 'change_password'),
                    leading: Icon(Icons.lock),
                    title: Text('Change Password'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () => toPage(context, pageName: 'saved_addresses'),
                    leading: Icon(Icons.location_on),
                    title: Text('Saved Addresses'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () => toPage(context, pageName: 'saved_cards'),
                    leading: Icon(Icons.credit_card),
                    title: Text('Saved Cards'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () => logout(context),
                    leading: Icon(Icons.power_settings_new),
                    title: Text('Logout'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
