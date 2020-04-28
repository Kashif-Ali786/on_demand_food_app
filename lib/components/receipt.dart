import 'package:flutter/material.dart';
import 'package:on_demand_food/constants.dart';

class Receipt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: <Widget>[
          ItemCost(name: 'Food & Beverage Subtotal', cost: 12.39),
          SizedBox(height: 4),
          ItemCost(name: 'Delivery Fee', cost: 5.29),
          SizedBox(height: 4),
          ItemCost(name: 'Courier Tip', cost: 3.00),
          SizedBox(height: 4),
          ItemCost(name: 'GST', cost: 0.83),
          SizedBox(height: 4),
          ItemCost(name: 'PST', cost: 0.87),
          Divider(
            thickness: 1,
          ),
          ItemCost(
            name: 'Total',
            cost: 21.28,
            isBold: true,
          ),
        ],
      ),
    );
  }
}

class ItemCost extends StatelessWidget {
  final String name;
  final double cost;
  final bool isBold;
  ItemCost({this.name, this.cost, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '$name',
          style: isBold ? kBoldFont : null,
        ),
        Text(
          '\$${cost.toStringAsFixed(2)}',
          style: isBold ? kBoldFont : null,
        )
      ],
    );
  }
}
