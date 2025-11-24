import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/useCases/shoppingBag/ShoppingBagUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/detail/bloc/ClientProductDetailEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/detail/bloc/ClientProductDetailState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientProductDetailBloc
    extends Bloc<ClientProductDetailEvent, ClientProductDetailState> {
  ShoppingBagUseCases shoppingBagUseCases;

  ClientProductDetailBloc(this.shoppingBagUseCases)
    : super(ClientProductDetailState()) {
    on<GetProductsClientProductDetail>(_onGetProducts);
    on<AddItemClientProductDetail>(_onAddItem);
    on<SubstractItemClientProductDetail>(_onSubstractItem);
    on<AddProductToShoppingBagClientProductDetail>(_onAddProductToShoppingBag);
    on<ResetStateClientProductDetail>(_onResetState);
  }

  Future<void> _onGetProducts(
    GetProductsClientProductDetail event,
    Emitter<ClientProductDetailState> emit,
  ) async {
    List<Product> products = await shoppingBagUseCases.getProducts.run();
    int index = products.indexWhere(
      (producto) => producto.id == event.product.id,
    );

    if (index != -1) {
      emit(state.copyWith(quantity: products[index].quantity));
    }
  }

  Future<void> _onAddItem(
    AddItemClientProductDetail event,
    Emitter<ClientProductDetailState> emit,
  ) async {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  Future<void> _onSubstractItem(
    SubstractItemClientProductDetail event,
    Emitter<ClientProductDetailState> emit,
  ) async {
    if (state.quantity >= 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  Future<void> _onAddProductToShoppingBag(
    AddProductToShoppingBagClientProductDetail event,
    Emitter<ClientProductDetailState> emit,
  ) async {
    event.product.quantity = state.quantity;
    print('AGREGANDO PRODUCTO: ${event.product.toJson()}');
    await shoppingBagUseCases.add.run(event.product);
  }

  Future<void> _onResetState(
    ResetStateClientProductDetail event,
    Emitter<ClientProductDetailState> emit,
  ) async {
    emit(state.copyWith(quantity: 0));
  }
}
