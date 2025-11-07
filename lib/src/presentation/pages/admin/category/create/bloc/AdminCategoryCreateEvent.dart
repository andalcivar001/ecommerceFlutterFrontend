import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class AdminCategoryCreateEvent extends Equatable {
  const AdminCategoryCreateEvent();
  @override
  List<Object?> get props => [];
}

class AdminCategoryCraeteInitEvent extends AdminCategoryCreateEvent {
  const AdminCategoryCraeteInitEvent();

  @override
  List<Object?> get props => [];
}

class AdminCategoryCreateNameChanged extends AdminCategoryCreateEvent {
  final BlocFormItem name;
  const AdminCategoryCreateNameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class AdminCategoryCreateDescriptionChanged extends AdminCategoryCreateEvent {
  final BlocFormItem description;
  const AdminCategoryCreateDescriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class AdminCategoryCreateFormSubmit extends AdminCategoryCreateEvent {
  const AdminCategoryCreateFormSubmit();
}

class AdminCategoryCreateResetForm extends AdminCategoryCreateEvent {
  const AdminCategoryCreateResetForm();
  @override
  List<Object?> get props => [];
}

class AdminCategoryCreatePickImage extends AdminCategoryCreateEvent {
  const AdminCategoryCreatePickImage();
}

class AdminCategoryCreateTakePhoto extends AdminCategoryCreateEvent {
  const AdminCategoryCreateTakePhoto();
}
