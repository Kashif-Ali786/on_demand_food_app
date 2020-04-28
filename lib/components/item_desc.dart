import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:on_demand_food/constants.dart';
import 'package:on_demand_food/components/multiple_pics_header.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:on_demand_food/components/single_pic_header.dart';

class ItemDesc extends StatefulWidget {
  final String imageURL;
  final String name;
  final String description;
  final double price;

  ItemDesc({this.name, this.description, this.price, this.imageURL = null});

  @override
  _ItemDescState createState() => _ItemDescState();
}

class _ItemDescState extends State<ItemDesc> {
  addItem(context) {
    Navigator.pop(context);
  }

  bool showTitle = false;

  toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  //can be used if anything needs to change while checking app bar
//  ScrollController _scrollController;
//
//  bool get _isAppBarExpanded {
//    print('header.offset');
//    print((MediaQuery.of(context).size.height / 1.5) - kToolbarHeight);
//    print('_scrollController.offset');
//    print(_scrollController.offset);
//
//    return _scrollController.hasClients &&
//        _scrollController.offset > (200 - kToolbarHeight);
//  }
//

  @override
  void initState() {
    super.initState();
//    _scrollController = ScrollController();
//    _scrollController.addListener(manageTitle);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var headerHeight = mediaQuery.size.height / 2;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        print('hide');
        FocusScope.of(context).unfocus();
        FocusNode().unfocus();
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: CustomScrollView(
//                controller: _scrollController,
                slivers: <Widget>[
                  SliverAppBar(
                    elevation: 0,
                    stretch: true,
                    centerTitle: true,
                    pinned: true,
                    backgroundColor: Theme.of(context).canvasColor,
                    textTheme: Theme.of(context).textTheme,
                    iconTheme: Theme.of(context).iconTheme,
                    brightness: widget.imageURL != null
                        ? Brightness.dark
                        : Brightness.light,
                    expandedHeight:
                        widget.imageURL != null ? headerHeight : null,
                    title: Text(widget.name, style: kBoldFont),
                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: <StretchMode>[
                        StretchMode.zoomBackground,
                        StretchMode.fadeTitle,
                      ],
                      background: widget.imageURL != null
                          ? SinglePicHeader(imageURL: widget.imageURL)
                          // if you want to use multiple picture you can uncomment the bottom line
                          //MultiplePicsHeader(),
                          : null,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: <Widget>[
                            Text(widget.description,
                                style: kMainFontTextStyleLight),
                          ],
                        )),
                  ),
                  ItemOptions(heading: 'Options 1'),
                  ItemOptions(heading: 'Options 2'),
                  ItemOptions(heading: 'Options 3'),
                  ItemOptions(heading: 'Options 4'),
                  SliverToBoxAdapter(
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: TextField(
                            decoration: InputDecoration(
                                border: null,
                                hintText: 'Special Instructions ?'),
                          ))),
                  SliverToBoxAdapter(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () => null,
                            child: Icon(Icons.remove),
                          ),
                          Text('1', style: kBigFontTextStyleLight),
                          RaisedButton(
                            onPressed: () => null,
                            child: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              child: RaisedButton(
                color: kPrimaryColor,
                onPressed: () => addItem(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      'Add to Order',
                      style: kMainFontTextStyleDark,
                    ),
                    Container(
                      width: 100,
                      child: Text('\$1124.50', style: kMainFontTextStyleDark),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemOptions extends StatelessWidget {
  final String heading;
  ItemOptions({this.heading});
  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Container(
        height: 70,
        color: Colors.grey[200],
        alignment: Alignment.centerLeft,
        child: new ListTile(
          title: Text(heading),
          subtitle: Text('Select any option'),
        ),
      ),
      sliver: SliverList(
        delegate: new SliverChildBuilderDelegate(
          (context, i) => CheckboxListTile(
            title: Text('Hot Sauce'),
            secondary: Text('+\$1.00'),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: kPrimaryColor,
            value: i % 2 == 0,
            onChanged: (val) => true,
          ),
          childCount: 8,
        ),
      ),
    );
  }
}
