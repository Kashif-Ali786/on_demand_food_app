import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:on_demand_food/constants.dart';
import 'package:on_demand_food/pages/account.dart';
import 'package:on_demand_food/pages/home.dart';
import 'package:on_demand_food/pages/orders.dart';
import 'package:on_demand_food/state.dart';

List views = [
  {'page': HomePage(), 'icon': Icons.fastfood},
  {'page': OrdersPage(), 'icon': Icons.receipt},
  {'page': AccountPage(), 'icon': Icons.account_circle},
];

class Home extends StatefulWidget {
  @override
  Home_State createState() => Home_State();
}

class Home_State extends State<Home> {
  int viewIndex = 0;

  toggleSearchbar(context) {
    Provider.of<GlobalState>(context, listen: false).toggleSearchbar();
  }

  changePage(int newIndex) {
    setState(() {
      viewIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool showSearchbar = Provider.of<GlobalState>(context).showSearchbar;
    return Scaffold(
      primary: false,
      body: Container(
        height: double.infinity,
        child: views[viewIndex]['page'],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      //only show search button on homepage to search restaurants
      floatingActionButton: viewIndex == 0 && !showSearchbar && kShowStoreSearch
          ? FloatingActionButton(
              child: Icon(Icons.search),
              backgroundColor: Colors.black,
              onPressed: () => toggleSearchbar(context),
            )
          : null,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        notchMargin: 6.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Spacer(flex: 1),
            IconButton(
              icon: Icon(
                views[0]['icon'],
                size: 28,
              ),
              onPressed: () => changePage(0),
              color: viewIndex == 0 ? kPrimaryColor : Colors.black,
            ),
            Spacer(flex: 1),
            IconButton(
              icon: Icon(
                views[1]['icon'],
                size: 28,
              ),
              onPressed: () => changePage(1),
              color: viewIndex == 1 ? kPrimaryColor : Colors.black,
            ),
            Spacer(flex: 1),
            IconButton(
              icon: Icon(
                views[2]['icon'],
                size: 28,
              ),
              onPressed: () => changePage(2),
              color: viewIndex == 2 ? kPrimaryColor : Colors.black,
            ),
            //adjust bottom app bar space for search FAB if it is visible or hidden
            Spacer(
                flex: viewIndex == 0 && !showSearchbar && kShowStoreSearch
                    ? 2
                    : 1),
          ],
        ),
      ),
    );
  }
}
