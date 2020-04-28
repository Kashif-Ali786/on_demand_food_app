import 'package:flutter/material.dart';
import 'package:on_demand_food/components/add_new_address_sheet.dart';

class SavedAddresses extends StatefulWidget {
  @override
  _SavedAddressesState createState() => _SavedAddressesState();
}

class _SavedAddressesState extends State<SavedAddresses> {
  final addresses = [
    {'address': '77 University Cres', 'city': 'Winnipeg, MB', 'selected': true},
    {'address': '33 Blue Wing Place', 'city': 'Winnipeg, MB'},
  ];

  addNewAddres(context) {
    showAddNewAddressBottomSheet(context);
  }

  removeAddres() {}

  handleSelect(index) {
    print(index);
    setState(() {
      for (int i = 0; i < addresses.length; i++) {
        if (index == i)
          addresses[i]['selected'] = true;
        else
          addresses[i]['selected'] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Addreses'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            contentPadding:
                EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 0),
            onTap: () => addNewAddres(context),
            leading: Icon(Icons.add),
            title: Text('Add new address'),
          ),
          Divider(
            thickness: 8,
            height: 8.3,
          ),
          for (int i = 0; i < addresses.length; i++)
            AddressTile(
              address: addresses[i]['address'],
              city: addresses[i]['city'],
              selected: addresses[i]['selected'] == true ? true : false,
              handleTap: (index) => handleSelect(index),
              index: i,
            ),
        ],
      ),
    );
  }
}

class AddressTile extends StatelessWidget {
  final String address;
  final String city;
  final bool selected;
  final int index;
  Function handleTap;

  AddressTile(
      {this.address,
      this.city,
      this.selected = false,
      this.index = -1,
      this.handleTap});

  onTap() {
    if (handleTap != null) handleTap(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () => onTap(),
          selected: selected,
          leading: Icon(Icons.location_on),
          title: Text(address),
          subtitle: Text(city),
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
