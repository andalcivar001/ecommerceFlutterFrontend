import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminProductCreateState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem description;
  final BlocFormItem price;
  final GlobalKey<FormState>? formKey;
  final File? image1;
  final File? image2;
  final Resource? response;

  const AdminProductCreateState({
    this.name = const BlocFormItem(error: 'Ingrese el nombre'),
    this.description = const BlocFormItem(error: 'Ingrese la descripcion'),
    this.price = const BlocFormItem(error: 'Ingrese el precio'),
    this.formKey,
    this.image1,
    this.image2,
    this.response,
  });

  AdminProductCreateState resetForm() {
    return AdminProductCreateState(
      name: const BlocFormItem(error: 'Ingrese el nombre'),
      description: const BlocFormItem(error: 'Ingrese la descripcion'),
    );
  }

  toCategory() => Category(name: name.value, description: description.value);

  AdminProductCreateState copyWith({
    BlocFormItem? name,
    BlocFormItem? description,
    BlocFormItem? price,
    File? image1,
    File? image2,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return AdminProductCreateState(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image1: image1 ?? this.image1,
      image2: image2 ?? this.image2,
      formKey: formKey,
      response: response,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    description,
    price,
    image1,
    image2,
    response,
  ];
}
