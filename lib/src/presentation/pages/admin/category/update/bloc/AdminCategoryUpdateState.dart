import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminCategoryUpdateState extends Equatable {
  final int id;
  final BlocFormItem name;
  final BlocFormItem description;
  final GlobalKey<FormState>? formKey;
  final File? image;
  final Resource? response;

  const AdminCategoryUpdateState({
    this.id = 0,
    this.name = const BlocFormItem(error: 'Ingrese el nombre'),
    this.description = const BlocFormItem(error: 'Ingrese la descripcion'),
    this.formKey,
    this.image,
    this.response,
  });

  toCategory() => Category(name: name.value, description: description.value);

  AdminCategoryUpdateState copyWith({
    int? id,
    BlocFormItem? name,
    BlocFormItem? description,
    File? image,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return AdminCategoryUpdateState(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      formKey: formKey,
      response: response,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, description, image, response];
}
