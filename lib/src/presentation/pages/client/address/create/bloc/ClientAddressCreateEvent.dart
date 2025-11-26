import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class ClientAddressCreateEvent extends Equatable {
  const ClientAddressCreateEvent();
  @override
  List<Object?> get props => [];
}

class InitEventClientAddressCreate extends ClientAddressCreateEvent {
  const InitEventClientAddressCreate();
}

class AddressChangedClientAddressCreate extends ClientAddressCreateEvent {
  final BlocFormItem address;
  const AddressChangedClientAddressCreate({required this.address});

  @override
  List<Object?> get props => [address];
}

class NeighborhoodChangedClientAddressCreate extends ClientAddressCreateEvent {
  final BlocFormItem neighborhood;
  const NeighborhoodChangedClientAddressCreate({required this.neighborhood});

  @override
  List<Object?> get props => [neighborhood];
}

class FormSubmitClientAddressCreate extends ClientAddressCreateEvent {
  const FormSubmitClientAddressCreate();
}
