import 'package:ecommerce_flutter/src/domain/models/Address.dart';
import 'package:equatable/equatable.dart';

abstract class ClientAddressListEvent extends Equatable {
  const ClientAddressListEvent();
  @override
  List<Object?> get props => [];
}

class ClientAddressListGetUserAddress extends ClientAddressListEvent {
  const ClientAddressListGetUserAddress();
}

class ClientAddressListDeleteUserAddress extends ClientAddressListEvent {
  final int id;
  const ClientAddressListDeleteUserAddress({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class ClientAddressListChangeRadioValue extends ClientAddressListEvent {
  final int radioValue;
  final Address address;
  const ClientAddressListChangeRadioValue({
    required this.radioValue,
    required this.address,
  });
  @override
  List<Object?> get props => [radioValue, address];
}

class SetAddressSession extends ClientAddressListEvent {
  final List<Address> addressList;
  const SetAddressSession({required this.addressList});
  @override
  // TODO: implement props
  List<Object?> get props => [addressList];
}

class DeleteAddress extends ClientAddressListEvent {
  final int id;
  const DeleteAddress({required this.id});
  @override
  List<Object?> get props => [id];
}
