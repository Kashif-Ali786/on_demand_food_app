import 'package:flutter/material.dart';
import 'package:on_demand_food/state.dart';
import 'package:provider/provider.dart';

class Searchbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: Colors.white,
      child: ListTile(
        dense: true,
        leading: Icon(Icons.search),
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Type name here...',
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => Provider.of<GlobalState>(context, listen: false)
              .toggleSearchbar(),
        ),
      ),
    );
  }
}
