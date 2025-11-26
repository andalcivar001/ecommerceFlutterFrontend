import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:equatable/equatable.dart';

abstract class ClientShoppingBagEvent extends Equatable {
  const ClientShoppingBagEvent();
  @override
  List<Object?> get props => [];
}

class GetClientShoppingBag extends ClientShoppingBagEvent {
  const GetClientShoppingBag();
}

class AddItemClientShoppingBag extends ClientShoppingBagEvent {
  final Product product;
  const AddItemClientShoppingBag({required this.product});
  @override
  List<Object?> get props => [product];
}

class SubstractClientShoppingBag extends ClientShoppingBagEvent {
  final Product product;
  const SubstractClientShoppingBag({required this.product});
  @override
  List<Object?> get props => [product];
}

class RemoveItemClientShoppingBag extends ClientShoppingBagEvent {
  final Product product;
  const RemoveItemClientShoppingBag({required this.product});
  @override
  List<Object?> get props => [product];
}

class GetTotalClientShoppingBag extends ClientShoppingBagEvent {
  const GetTotalClientShoppingBag();
}
