import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminCategoryCreateState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem description;
  final GlobalKey<FormState>? formKey;
  final File? image;
  final Resource? response;

  const AdminCategoryCreateState({
    this.name = const BlocFormItem(error: 'Ingrese el nombre'),
    this.description = const BlocFormItem(error: 'Ingrese la descripcion'),
    this.formKey,
    this.image,
    this.response,
  });

  AdminCategoryCreateState resetForm() {
    return AdminCategoryCreateState(
      name: const BlocFormItem(error: 'Ingrese el nombre'),
      description: const BlocFormItem(error: 'Ingrese la descripcion'),
    );
  }

  toCategory() => Category(name: name.value, description: description.value);

  AdminCategoryCreateState copyWith({
    BlocFormItem? name,
    BlocFormItem? description,
    File? image,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return AdminCategoryCreateState(
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      formKey: formKey,
      response: response,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name, description, image, response];
}
