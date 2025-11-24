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
  }
  Future<void> _onGetShoppingBag(
    GetClientShoppingBag event,
    Emitter<ClientShoppingBagState> emit,
  ) async {
    List<Product> products = await shoppingBagUseCases.getProducts.run();
    emit(state.copyWith(products: products));
  }
}
