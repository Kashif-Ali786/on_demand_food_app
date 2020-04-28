import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:on_demand_food/components/order_type_header.dart';
import 'package:on_demand_food/components/searchbar.dart';
import 'package:on_demand_food/components/store_categories.dart';
import 'package:on_demand_food/components/store_card.dart';
import 'package:on_demand_food/constants.dart';
import 'package:on_demand_food/modals/cart.dart';
import 'package:on_demand_food/state.dart';

final CartManager cartManager = CartManager();

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool showStoreCategories =
        !Provider.of<GlobalState>(context).showSearchbar &&
            kShowStoreCategories;
    return GestureDetector(
      onTap: () {
        //hide keyboard if tapped on screen other than an input area
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: OrderTypeHeader(),
          backgroundColor: Theme.of(context).canvasColor,
          brightness: Brightness.light,
        ),
        bottomNavigationBar: cartManager.getBottomCart(),
        body: Stack(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    //can be toggled from FAB on home screen, /sreens/home
                    if (Provider.of<GlobalState>(context).showSearchbar)
                      SizedBox(height: 70),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          //hide/show store categories if searchbar is enabled/disabled
                          if (showStoreCategories)
                            Categories(),
                          StoreCard(
                            name: 'A&W Burgers',
                            logo: 'images/locations/a&w.jpg',
                            bg: 'images/locations/a&w-bg.jpg',
                          ),
                          StoreCard(
                            name: 'A&W Burgers',
                            logo: 'images/locations/a&w.jpg',
                            bg: 'images/locations/a&w-bg.jpg',
                          ),
                          StoreCard(
                            name: 'A&W Burgers',
                            logo: 'images/locations/a&w.jpg',
                            bg: 'images/locations/a&w-bg.jpg',
                          ),
                          StoreCard(
                            name: 'A&W Burgers',
                            logo: 'images/locations/a&w.jpg',
                            bg: 'images/locations/a&w-bg.jpg',
                          ),
                          StoreCard(
                            name: 'A&W Burgers',
                            logo: 'images/locations/a&w.jpg',
                            bg: 'images/locations/a&w-bg.jpg',
                          ),
                        ],
                      ),
                    )
                  ],
                )),

            //can be toggled from FAB on home screen, /sreens/home
            if (Provider.of<GlobalState>(context).showSearchbar)
              Searchbar()
          ],
        ),
      ),
    );
  }
}
