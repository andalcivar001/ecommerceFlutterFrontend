import 'package:ecommerce_flutter/src/domain/useCases/products/ProductUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/list/bloc/ClientProductListEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/list/bloc/ClientProductListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientProductListBloc
    extends Bloc<ClientProductListEvent, ClientProductListState> {
  ProductUseCases productUseCases;

  ClientProductListBloc(this.productUseCases)
    : super(ClientProductListState()) {
    on<GetProductsByCategoryEvent>(_onGetProductsByCategory);
  }

  Future<void> _onGetProductsByCategory(
    GetProductsByCategoryEvent event,
    Emitter<ClientProductListState> emit,
  ) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await productUseCases.getProductsByCategory.run(
      event.idCategory,
    );

    emit(state.copyWith(response: response));
  }
}
