import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:on_demand_food/state.dart';
import 'package:on_demand_food/pages/store.dart';
import 'package:on_demand_food/constants.dart';

class StoreCard extends StatelessWidget {
  final String name;
  final String logo;
  final String bg;

  StoreCard({this.name, this.logo, this.bg});

  toStorePage(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Store(name: name, logo: logo, bg: bg)));
  }

  @override
  Widget build(BuildContext context) {
    bool showSearchbar = Provider.of<GlobalState>(context).showSearchbar;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 3,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () => toStorePage(context),
        child: Stack(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              !showSearchbar
                  ? Image.asset(
                      bg,
                      width: double.infinity,
                      height: 180.0,
                      fit: BoxFit.cover,
                    )
                  : Container(),
              Container(
                margin: EdgeInsets.only(top: 12, bottom: 8),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: StoreInfo(showSearchbar),
                ),
              ),
            ],
          ),
          !showSearchbar
              ? Positioned(
                  bottom: 100,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    height: 70,
                    width: 70,
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(6),
                      elevation: 4,
                      child: Image.asset(
                        logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              : Container(),
        ]),
      ),
    );
  }
}

List<Widget> StoreInfo(bool showSearchbar) {
  List<Widget> list = [];

  list.add(Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        children: <Widget>[
          showSearchbar
              ? Container(
                  height: 30,
                  width: 30,
                  child: Material(
                    borderRadius: BorderRadius.circular(6),
                    elevation: 4,
                    child: Image.asset(
                      'images/locations/a&w.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : Container(),
          if (showSearchbar) SizedBox(width: 8.0),
          Text(
            'A & W',
            style: kMainFontTextStyleLightBold,
          ),
        ],
      ),
      SizedBox(height: 4),
      Text(
        '393 Portage Ave. #232B',
        style: kSubtitleFontTextStyleLight,
      ),
      Text(
        'Winnipeg, MB',
        style: kSubtitleFontTextStyleLight,
      ),
    ],
  ));

  list.add(Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      Container(
        child: Text(
          '25 - 35 mins',
          style: kSubtitleFontTextStyleDark,
        ),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(4)),
      ),
      SizedBox(height: 4.0),
      Text(
        '1.2 km',
        style: kSubtitleFontTextStyleLight,
      )
    ],
  ));

  return list;
}
