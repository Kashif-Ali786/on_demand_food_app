import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_demand_food/components/menu_category.dart';
import 'package:on_demand_food/components/menu_item.dart';
import 'package:on_demand_food/constants.dart';
import 'package:on_demand_food/modals/cart.dart';

final CartManager cartManager = CartManager();

class Store extends StatelessWidget {
  final String name;
  final String logo;
  final String bg;
  ScrollController scroller = ScrollController();

  Store({this.name, this.logo, this.bg});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: cartManager.getBottomCart(),
      body: CustomScrollView(
        controller: scroller,
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            pinned: true,
            stretch: true,
            centerTitle: true,
            backgroundColor: kPrimaryColor,
            expandedHeight: 350,
            leading: BackButton(
              onPressed: () => Navigator.pop(context),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                color: Colors.white,
                onPressed: () => null,
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              title: Text(name),
              centerTitle: kShowLogoInAppbar ? true : false,
              background: Container(
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      bg,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black, Colors.black12]),
                      ),
                    ),
                    if (kShowLogoInAppbar)
                      Positioned(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 150,
                            width: 150,
                            child: Material(
                              borderRadius: BorderRadius.circular(6),
                              elevation: 4,
                              child: Image.asset(
                                'images/locations/a&w.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              leading: Container(
                height: 40,
                width: 40,
                child: Material(
                  borderRadius: BorderRadius.circular(6),
                  elevation: 4,
                  child: Image.asset(
                    'images/locations/a&w.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              title: Text('393 Portage Ave. #232B'),
              subtitle: Text('25 - 35 min'),
              trailing: IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () => null,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: CategoryHeader(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 8),
                MenuItem(
                  name: 'Chicken Wings',
                  price: 12.50,
                  description:
                      'One Pound of dusted, crispy, chicken wings tossed in your choice of sauce and/or dry rub.',
                  imageURL:
                      'https://assets.kraftfoods.com/recipe_images/180986.jpg',
                ),
                Divider(
                  thickness: 2,
                ),
                MenuItem(
                    name: 'Chicken Wings',
                    price: 12.50,
                    description:
                        'One Pound of dusted, crispy, chicken wings tossed in your choice of sauce and/or dry rub.'),
                Divider(
                  thickness: 2,
                ),
                MenuItem(
                  name: 'Chicken Wings',
                  price: 12.50,
                  description:
                      'One Pound of dusted, crispy, chicken wings tossed in your choice of sauce and/or dry rub.',
                  imageURL:
                      'https://assets.kraftfoods.com/recipe_images/180986.jpg',
                ),
                Divider(
                  thickness: 2,
                ),
                MenuItem(
                    name: 'Chicken Wings',
                    price: 12.50,
                    description:
                        'One Pound of dusted, crispy, chicken wings tossed in your choice of sauce and/or dry rub.'),
                Divider(
                  thickness: 2,
                ),
                MenuItem(
                  name: 'Chicken Wings',
                  price: 12.50,
                  description:
                      'One Pound of dusted, crispy, chicken wings tossed in your choice of sauce and/or dry rub.',
                  imageURL:
                      'https://assets.kraftfoods.com/recipe_images/180986.jpg',
                ),
                Divider(
                  thickness: 2,
                ),
                MenuItem(
                  name: 'Chicken Wings',
                  price: 12.50,
                  description:
                      'One Pound of dusted, crispy, chicken wings tossed in your choice of sauce and/or dry rub.',
                  imageURL:
                      'https://assets.kraftfoods.com/recipe_images/180986.jpg',
                ),
                Divider(
                  thickness: 2,
                ),
                MenuItem(
                    name: 'Chicken Wings',
                    price: 12.50,
                    description:
                        'One Pound of dusted, crispy, chicken wings tossed in your choice of sauce and/or dry rub.'),
                Divider(
                  thickness: 2,
                ),
                MenuItem(
                    name: 'Chicken Wings',
                    price: 12.50,
                    description:
                        'One Pound of dusted, crispy, chicken wings tossed in your choice of sauce and/or dry rub.'),
                Divider(
                  thickness: 2,
                ),
                MenuItem(
                  name: 'Chicken Wings',
                  price: 12.50,
                  description:
                      'One Pound of dusted, crispy, chicken wings tossed in your choice of sauce and/or dry rub.',
                  imageURL:
                      'https://assets.kraftfoods.com/recipe_images/180986.jpg',
                ),
                Divider(
                  thickness: 2,
                ),
                MenuItem(
                    name: 'Chicken Wings',
                    price: 12.50,
                    description:
                        'One Pound of dusted, crispy, chicken wings tossed in your choice of sauce and/or dry rub.'),
                Divider(
                  thickness: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
