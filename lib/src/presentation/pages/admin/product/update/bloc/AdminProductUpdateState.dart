import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminProductUpdateState extends Equatable {
  final int id;
  final BlocFormItem name;
  final BlocFormItem description;
  final BlocFormItem price;
  final GlobalKey<FormState>? formKey;
  final int idCategory;
  final File? image1;
  final File? image2;
  final Resource? response;
  final List<int>? imagesToUpdate;

  const AdminProductUpdateState({
    this.id = 0,
    this.name = const BlocFormItem(error: 'Ingrese el nombre'),
    this.description = const BlocFormItem(error: 'Ingrese la descripcion'),
    this.price = const BlocFormItem(error: 'Ingrese el precio'),
    this.formKey,
    this.image1,
    this.image2,
    this.response,
    this.idCategory = 0,
    this.imagesToUpdate,
  });

  AdminProductUpdateState resetForm() {
    return AdminProductUpdateState(image1: null, image2: null);
  }

  toProduct() => Product(
    id: id,
    name: name.value,
    description: description.value,
    price: double.parse(price.value),
    idCategory: idCategory,
  );

  AdminProductUpdateState copyWith({
    int? id,
    int? idCategory,
    BlocFormItem? name,
    BlocFormItem? description,
    BlocFormItem? price,
    File? image1,
    File? image2,
    GlobalKey<FormState>? formKey,
    Resource? response,
    List<int>? imagesToUpdate,
  }) {
    return AdminProductUpdateState(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image1: image1 ?? this.image1,
      image2: image2 ?? this.image2,
      formKey: formKey,
      response: response,
      idCategory: idCategory ?? this.idCategory,
      imagesToUpdate: imagesToUpdate ?? this.imagesToUpdate,
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
    idCategory,
  ];
}
