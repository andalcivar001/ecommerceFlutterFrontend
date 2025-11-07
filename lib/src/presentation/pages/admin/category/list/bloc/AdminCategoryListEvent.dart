import 'package:equatable/equatable.dart';

abstract class AdminCategoryListEvent extends Equatable {
  const AdminCategoryListEvent();
  @override
  List<Object?> get props => [];
}

class AdminCategoryListGetCategory extends AdminCategoryListEvent {
  const AdminCategoryListGetCategory();
}

class AdminCategoryListDeleteCategory extends AdminCategoryListEvent {
  final int id;
  const AdminCategoryListDeleteCategory({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
