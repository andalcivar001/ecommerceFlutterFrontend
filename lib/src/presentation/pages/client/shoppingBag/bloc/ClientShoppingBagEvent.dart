import 'package:equatable/equatable.dart';

abstract class ClientShoppingBagEvent extends Equatable {
  const ClientShoppingBagEvent();
  @override
  List<Object?> get props => [];
}

class GetClientShoppingBag extends ClientShoppingBagEvent {
  const GetClientShoppingBag();
}
