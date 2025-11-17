import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class AdminProductUpdateEvent extends Equatable {
  const AdminProductUpdateEvent();
  @override
  List<Object?> get props => [];
}

class AdminProductUpdateInitEvent extends AdminProductUpdateEvent {
  final Product? product;
  const AdminProductUpdateInitEvent({required this.product});

  @override
  List<Object?> get props => [product];
}

class AdminProductUpdateNameChanged extends AdminProductUpdateEvent {
  final BlocFormItem name;
  const AdminProductUpdateNameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class AdminProductUpdateDescriptionChanged extends AdminProductUpdateEvent {
  final BlocFormItem description;
  const AdminProductUpdateDescriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class AdminProductUpdatePriceChanged extends AdminProductUpdateEvent {
  final BlocFormItem price;
  const AdminProductUpdatePriceChanged({required this.price});
  @override
  List<Object?> get props => [price];
}

class AdminProductUpdateFormSubmit extends AdminProductUpdateEvent {
  const AdminProductUpdateFormSubmit();
}

class AdminProductUpdateResetForm extends AdminProductUpdateEvent {
  const AdminProductUpdateResetForm();
  @override
  List<Object?> get props => [];
}

class AdminProductUpdatePickImage extends AdminProductUpdateEvent {
  final int numberFile;
  const AdminProductUpdatePickImage({required this.numberFile});
}

class AdminProductUpdateTakePhoto extends AdminProductUpdateEvent {
  final int numberFile;
  const AdminProductUpdateTakePhoto({required this.numberFile});
}
