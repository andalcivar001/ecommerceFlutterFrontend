import 'package:ecommerce_flutter/src/domain/models/Address.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/bloc/ClientAddressListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/bloc/ClientAddressListEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/list/bloc/ClientAddressListState.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClientAddressListItem extends StatelessWidget {
  ClientAddressListBloc? bloc;
  Address address;
  int index;
  ClientAddressListState state;
  ClientAddressListItem(this.bloc, this.state, this.address, this.index);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Radio(
        value: index,
        groupValue: state.radioValue,
        onChanged: (value) {
          bloc?.add(
            ClientAddressListChangeRadioValue(
              radioValue: value!,
              address: address,
            ),
          );
        },
      ),
      title: Text(
        address.address,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        address.neighborhood,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          bloc?.add(DeleteAddress(id: address.id!));
          Fluttertoast.showToast(
            msg: 'La dirección fue eliminada correctamente',
            toastLength: Toast.LENGTH_LONG,
          );
        },
      ),
    );
    Divider(color: Colors.grey[300], indent: 40, endIndent: 30);
  }
}
