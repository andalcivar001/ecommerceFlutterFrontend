import 'package:ecommerce_flutter/src/domain/models/Address.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/bloc/ClientAddressListBloc.dart';
import 'package:flutter/material.dart';

class ClientAddressListItem extends StatelessWidget {
  ClientAddressListBloc? bloc;
  Address address;
  int index;
  ClientAddressListItem(this.bloc, this.address, this.index);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Radio(value: index, groupValue: 0, onChanged: (value) {}),
      title: Text(
        address.address,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        address.neighborhood,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
    Divider(color: Colors.grey[300], indent: 40, endIndent: 30);
  }
}
