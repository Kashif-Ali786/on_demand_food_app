import 'package:flutter/material.dart';
import 'package:on_demand_food/constants.dart';
import 'package:on_demand_food/components/add_new_card_sheet.dart';

final cards = [
  {'name': '4242****4242', 'type': 'visa', 'icon': 'images/icons/visa.png'},
  {'name': '2222****2222', 'type': 'visa', 'icon': 'images/icons/visa.png'},
  {
    'name': '6262****6262',
    'type': 'master',
    'icon': 'images/icons/mastercard.png'
  },
  {'name': 'Apple Pay', 'type': 'apple', 'icon': 'images/icons/apple_pay.png'},
  {'name': 'G Pay', 'type': 'google', 'icon': 'images/icons/google_pay.png'},
];

class SavedCards extends StatefulWidget {
  @override
  _SavedCardsState createState() => _SavedCardsState();
}

class _SavedCardsState extends State<SavedCards> {
  addNewCard(context) {
    showAddNewCardBottomSheet(context);
  }

  removeCard() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Cards'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            contentPadding:
                EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 0),
            onTap: () => addNewCard(context),
            leading: Icon(Icons.add),
            title: Text('Add new card'),
          ),
          Divider(
            thickness: 8,
            height: 8.3,
          ),
          for (var card in cards)
            PaymentTypeTile(
              name: card['name'],
              image: card['icon'],
            ),
        ],
      ),
    );
  }
}

class PaymentTypeTile extends StatelessWidget {
  final String name;
  final String image;

  PaymentTypeTile({this.name, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Image.asset(
            image,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
          title: Text(name),
          trailing: IconButton(
            onPressed: () => null,
            icon: Icon(Icons.clear),
            color: Colors.red,
          ),
        ),
        Divider()
      ],
    );
  }
}
