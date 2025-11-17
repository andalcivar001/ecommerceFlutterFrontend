import 'package:ecommerce_flutter/src/domain/useCases/products/ProductUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/list/bloc/AdminProductListEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/list/bloc/AdminProductListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminProductListBloc
    extends Bloc<AdminProductListEvent, AdminProductListState> {
  ProductUseCases productUseCases;

  AdminProductListBloc(this.productUseCases) : super(AdminProductListState()) {
    on<GetProductsByCategoryEvent>(_onGetProductsByCategory);
    on<DeleteProduct>(_onDeleteProduct);
  }

  Future<void> _onGetProductsByCategory(
    GetProductsByCategoryEvent event,
    Emitter<AdminProductListState> emit,
  ) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await productUseCases.getProductsByCategory.run(
      event.idCategory,
    );

    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteProduct(
    DeleteProduct event,
    Emitter<AdminProductListState> emit,
  ) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await productUseCases.delete.run(event.id);
  }
}
