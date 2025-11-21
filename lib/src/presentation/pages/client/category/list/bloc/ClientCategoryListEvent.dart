import 'package:equatable/equatable.dart';

abstract class ClientCategoryListEvent extends Equatable {
  const ClientCategoryListEvent();
  @override
  List<Object?> get props => [];
}

class ClientCategoryListGetCategory extends ClientCategoryListEvent {
  const ClientCategoryListGetCategory();
}

class ClientCategoryListDeleteCategory extends ClientCategoryListEvent {
  final int id;
  const ClientCategoryListDeleteCategory({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
