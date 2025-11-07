import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class AdminCategoryUpdateEvent extends Equatable {
  const AdminCategoryUpdateEvent();
  @override
  List<Object?> get props => [];
}

class AdminCategoryUpdateInitEvent extends AdminCategoryUpdateEvent {
  final Category? category;

  const AdminCategoryUpdateInitEvent({required this.category});

  @override
  List<Object?> get props => [category];
}

class AdminCategoryUpdateNameChanged extends AdminCategoryUpdateEvent {
  final BlocFormItem name;
  const AdminCategoryUpdateNameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class AdminCategoryUpdateDescriptionChanged extends AdminCategoryUpdateEvent {
  final BlocFormItem description;
  const AdminCategoryUpdateDescriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class AdminCategoryUpdateFormSubmit extends AdminCategoryUpdateEvent {
  const AdminCategoryUpdateFormSubmit();
}

class AdminCategoryUpdatePickImage extends AdminCategoryUpdateEvent {
  const AdminCategoryUpdatePickImage();
}

class AdminCategoryUpdateTakePhoto extends AdminCategoryUpdateEvent {
  const AdminCategoryUpdateTakePhoto();
}
