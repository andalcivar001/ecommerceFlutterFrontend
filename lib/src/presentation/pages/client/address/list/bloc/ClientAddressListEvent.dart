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
