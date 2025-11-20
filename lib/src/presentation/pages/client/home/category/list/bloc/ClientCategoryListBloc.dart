import 'package:ecommerce_flutter/src/domain/useCases/category/CategoryUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/home/category/list/bloc/ClientCategoryListEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/home/category/list/bloc/ClientCategoryListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientCategoryListBloc
    extends Bloc<ClientCategoryListEvent, ClientCategoryListState> {
  CategoryUseCases categoryUseCase;

  ClientCategoryListBloc(this.categoryUseCase)
    : super(ClientCategoryListState()) {
    on<ClientCategoryListGetCategory>(_onGetCatogory);
    on<ClientCategoryListDeleteCategory>(_onDeleteCatogory);
  }

  Future<void> _onGetCatogory(
    ClientCategoryListGetCategory event,
    Emitter<ClientCategoryListState> emit,
  ) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await categoryUseCase.getCategory.run();
    emit(state.copyWith(response: response));
  }

  Future<void> _onDeleteCatogory(
    ClientCategoryListDeleteCategory event,
    Emitter<ClientCategoryListState> emit,
  ) async {
    emit(state.copyWith(response: Loading()));
    Resource response = await categoryUseCase.delete.run(event.id);
    emit(state.copyWith(response: response));
  }
}
