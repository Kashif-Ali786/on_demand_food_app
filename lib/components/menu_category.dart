import 'package:flutter/material.dart';
import 'package:on_demand_food/constants.dart';

class CategoryName extends StatelessWidget {
  final String name;
  final bool isSelected;

  CategoryName({this.name, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () => null,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? kPrimaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(
          name,
          style: isSelected ? kMainFontTextStyleDark : kMainFontTextStyleLight,
        ),
      ),
    );
  }
}

class CategoryHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.black12),
            top: BorderSide(color: Colors.black12),
          )),
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryName(
            name: 'Appys',
            isSelected: true,
          ),
          SizedBox(width: 8),
          CategoryName(name: 'Beverages'),
          SizedBox(width: 8),
          CategoryName(
            name: 'Bowls',
          ),
          SizedBox(width: 8),
          CategoryName(
            name: 'Desserts',
          ),
          SizedBox(width: 8),
          CategoryName(
            name: 'Greens',
          ),
          SizedBox(width: 8),
          CategoryName(
            name: 'Plates & Baskets',
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 70.0;

  @override
  double get minExtent => 54.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
