import 'package:flutter/material.dart';
import 'package:on_demand_food/pages/address.dart';
import 'package:provider/provider.dart';
import 'package:on_demand_food/global_navigator.dart';
import 'package:on_demand_food/state.dart';
import 'package:on_demand_food/pages/login.dart';
import 'constants.dart';
import 'screens/home.dart';
import 'package:on_demand_food/pages/edit_profile.dart';
import 'package:on_demand_food/pages/change_password.dart';
import 'package:on_demand_food/pages/saved_cards.dart';
import 'package:on_demand_food/pages/saved_addresses.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GlobalState(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            accentColor: kPrimaryColor,
            primaryColor: kPrimaryColor,
            brightness: Brightness.light),
        title: 'On Demand Starter Restaurant Kit',
        routes: {
          '/': (context) => Login(),
          '/address': (context) => Address(),
          '/home': (context) => Home(),
          '/edit_profile': (context) => EditProfile(),
          '/change_password': (context) => ChangePassword(),
          '/saved_cards': (context) => SavedCards(),
          '/saved_addresses': (context) => SavedAddresses(),
        },
      ),
    );
  }
}
