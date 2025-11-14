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
  }

  Future<void> _onGetProductsByCategory(
    GetProductsByCategoryEvent event,
    Emitter<AdminProductListState> emit,
  ) async {
    emit(state.copyWith(response: Loading()));

    Resource resource = await productUseCases.getProductsByCategory.run(
      event.idCategory,
    );
  }
}
