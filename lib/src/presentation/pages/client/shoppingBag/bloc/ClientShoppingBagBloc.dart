import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/useCases/shoppingBag/ShoppingBagUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/bloc/ClientShoppingBagEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/shoppingBag/bloc/ClientShoppingBagState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientShoppingBagBloc
    extends Bloc<ClientShoppingBagEvent, ClientShoppingBagState> {
  ShoppingBagUseCases shoppingBagUseCases;

  ClientShoppingBagBloc(this.shoppingBagUseCases)
    : super(ClientShoppingBagState()) {
    on<GetClientShoppingBag>(_onGetShoppingBag);
    on<AddItemClientShoppingBag>(_onAddItem);
    on<SubstractClientShoppingBag>(_onSubstractItem);
    on<RemoveItemClientShoppingBag>(_onRemoveItem);
    on<GetTotalClientShoppingBag>(_onGetTotal);
  }
  Future<void> _onGetShoppingBag(
    GetClientShoppingBag event,
    Emitter<ClientShoppingBagState> emit,
  ) async {
    List<Product> products = await shoppingBagUseCases.getProducts.run();
    emit(state.copyWith(products: products));
    add(GetTotalClientShoppingBag());
  }

  Future<void> _onAddItem(
    AddItemClientShoppingBag event,
    Emitter<ClientShoppingBagState> emit,
  ) async {
    event.product.quantity = event.product.quantity! + 1;
    await shoppingBagUseCases.add.run(event.product);
    add(GetTotalClientShoppingBag());
  }

  Future<void> _onSubstractItem(
    SubstractClientShoppingBag event,
    Emitter<ClientShoppingBagState> emit,
  ) async {
    if (event.product.quantity! > 1) {
      event.product.quantity = event.product.quantity! - 1;
      await shoppingBagUseCases.add.run(event.product);
      add(GetTotalClientShoppingBag());
    }
  }

  Future<void> _onRemoveItem(
    RemoveItemClientShoppingBag event,
    Emitter<ClientShoppingBagState> emit,
  ) async {
    await shoppingBagUseCases.deleteItem.run(event.product);
    add(GetTotalClientShoppingBag());
  }

  Future<void> _onGetTotal(
    GetTotalClientShoppingBag event,
    Emitter<ClientShoppingBagState> emit,
  ) async {
    double total = await shoppingBagUseCases.getTotal.run();
    emit(state.copyWith(total: total));
  }
}
