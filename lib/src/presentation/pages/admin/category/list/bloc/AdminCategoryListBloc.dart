import 'package:ecommerce_flutter/src/domain/useCases/category/CategoryUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/bloc/AdminCategoryListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCategoryListBloc
    extends Bloc<AdminCategoryListEvent, AdminCategoryListState> {
  CategoryUseCases categoryUseCase;

  AdminCategoryListBloc(this.categoryUseCase)
    : super(AdminCategoryListState()) {
    on<AdminCategoryListGetCategory>(_onGetCatogory);
    on<AdminCategoryListDeleteCategory>(_onDeleteCatogory);
  }

  Future<void> _onGetCatogory(
    AdminCategoryListGetCategory event,
    Emitter<AdminCategoryListState> emit,
  ) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await categoryUseCase.getCategory.run();
    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteCatogory(
    AdminCategoryListDeleteCategory event,
    Emitter<AdminCategoryListState> emit,
  ) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await categoryUseCase.delete.run(event.id);
    emit(state.copyWith(response: response));
  }
}
