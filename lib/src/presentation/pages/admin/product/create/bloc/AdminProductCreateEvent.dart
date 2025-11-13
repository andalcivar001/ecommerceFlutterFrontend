import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class AdminProductCreateEvent extends Equatable {
  const AdminProductCreateEvent();
  @override
  List<Object?> get props => [];
}

class AdminProductCreateInitEvent extends AdminProductCreateEvent {
  final Category? category;
  const AdminProductCreateInitEvent({required this.category});

  @override
  List<Object?> get props => [category];
}

class AdminProductCreateNameChanged extends AdminProductCreateEvent {
  final BlocFormItem name;
  const AdminProductCreateNameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class AdminProductCreateDescriptionChanged extends AdminProductCreateEvent {
  final BlocFormItem description;
  const AdminProductCreateDescriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class AdminProductCreatePriceChanged extends AdminProductCreateEvent {
  final BlocFormItem price;
  const AdminProductCreatePriceChanged({required this.price});
  @override
  List<Object?> get props => [price];
}

class AdminProductCreateFormSubmit extends AdminProductCreateEvent {
  const AdminProductCreateFormSubmit();
}

class AdminProductCreateResetForm extends AdminProductCreateEvent {
  const AdminProductCreateResetForm();
  @override
  List<Object?> get props => [];
}

class AdminProductCreatePickImage extends AdminProductCreateEvent {
  final int numberFile;
  const AdminProductCreatePickImage({required this.numberFile});
}

class AdminProductCreateTakePhoto extends AdminProductCreateEvent {
  final int numberFile;
  const AdminProductCreateTakePhoto({required this.numberFile});
}
