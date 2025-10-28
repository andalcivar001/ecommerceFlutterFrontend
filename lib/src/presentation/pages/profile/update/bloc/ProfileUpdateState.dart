import 'dart:io';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProfileUpdateState extends Equatable {
  // va de tipo string porque no se va  a trabajar validacion a diferencia de BlocFormItem
  final int id;
  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem phone;
  final GlobalKey<FormState>? formKey;
  final File? image;
  final Resource? response;

  toUser() => User(
    id: id,
    name: name.value,
    lastName: lastName.value,
    phone: phone.value,
  );

  const ProfileUpdateState({
    this.id = 0,
    this.name = const BlocFormItem(error: 'Ingrese el nombre'),
    this.lastName = const BlocFormItem(error: 'Ingrese el apellido'),
    this.phone = const BlocFormItem(error: 'Ingrese el teléfono'),
    this.formKey,
    this.image,
    this.response,
  });

  ProfileUpdateState copyWith({
    int? id,
    BlocFormItem? name,
    BlocFormItem? lastName,
    BlocFormItem? phone,
    File? image,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return ProfileUpdateState(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      formKey: formKey,
      response: response,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, lastName, phone, image, response];
}
