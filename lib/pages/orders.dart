import 'package:flutter/material.dart';
import 'package:on_demand_food/constants.dart';
import 'order_details.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TabBar(
              labelColor: kFontColor,
              indicatorColor: kPrimaryColor,
              tabs: [
                Tab(
                  text: 'Scheduled',
                ),
                Tab(
                  text: 'Past',
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                      child: ListView(
                    children: generateOrdersList(2, completed: false),
                  )),
                  Container(
                    child: ListView(
                      children: generateOrdersList(10, completed: true),
                    ),
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

List<Widget> generateOrdersList(int count, {bool completed = true}) {
  List<Widget> list = [];
  for (int i = 0; i < count; i++) {
    list.add(OrderInfoTile(
      completed: completed,
    ));
    list.add(Divider(
      height: 0,
    ));
  }
  return list;
}

class NoOrdersFound extends StatelessWidget {
  const NoOrdersFound({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No Scheduled Orders',
        style: kInfoFontTextStyleLight,
      ),
    );
  }
}

class OrderInfoTile extends StatelessWidget {
  showDetails(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OrderDetail()));
  }

  final bool completed;

  OrderInfoTile({this.completed = true});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      onTap: () => showDetails(context),
      leading: Material(
        borderRadius: BorderRadius.circular(6),
        elevation: 2,
        child: Image.network(
          'https://portageplace.ca/wp-content/uploads/2018/04/portageplace_aw-logo.jpg',
          fit: BoxFit.contain,
          height: 40,
          width: 40,
        ),
      ),
      title: Row(
        children: <Widget>[
          Text(
            'A&W Burgers',
            style: kMainFontTextStyleLight,
          ),
          if (completed) Icon(Icons.check_circle, color: kPrimaryColor),
        ],
      ),
      subtitle: Column(
        children: <Widget>[
          Text('Jan 18, 2020 at 12:30 PM'),
          SizedBox(height: 3),
          Text('#843023948'),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      trailing: Text(
        '\$25.50',
        style: kMainFontTextStyleLight,
      ),
      isThreeLine: true,
    );
  }
}
