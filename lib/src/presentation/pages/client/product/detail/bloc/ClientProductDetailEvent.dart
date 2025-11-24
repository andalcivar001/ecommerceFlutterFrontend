import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:equatable/equatable.dart';

abstract class ClientProductDetailEvent extends Equatable {
  const ClientProductDetailEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitEventClientProductDetail extends ClientProductDetailEvent {
  const InitEventClientProductDetail();
}

class GetProductsClientProductDetail extends ClientProductDetailEvent {
  const GetProductsClientProductDetail();
}

class AddItemClientProductDetail extends ClientProductDetailEvent {
  const AddItemClientProductDetail();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SubstractItemClientProductDetail extends ClientProductDetailEvent {
  const SubstractItemClientProductDetail();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddProductToShoppingBagClientProductDetail
    extends ClientProductDetailEvent {
  final Product product;
  const AddProductToShoppingBagClientProductDetail({required this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}
