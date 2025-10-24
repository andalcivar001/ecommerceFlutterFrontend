import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProfileUpdateState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem phone;
  final GlobalKey<FormState>? formKey;

  const ProfileUpdateState({
    this.name = const BlocFormItem(error: 'Ingrese el nombre'),
    this.lastName = const BlocFormItem(error: 'Ingrese el apellido'),
    this.phone = const BlocFormItem(error: 'Ingrese el teléfono'),
    this.formKey,
  });

  ProfileUpdateState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastName,
    BlocFormItem? phone,
    GlobalKey<FormState>? formKey,
  }) {
    return ProfileUpdateState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      formKey: formKey,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name, lastName, phone];
}
