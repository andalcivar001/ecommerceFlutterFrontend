import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Registerstate extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final BlocFormItem confirmPassword;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const Registerstate({
    this.name = const BlocFormItem(error: 'Ingrese el nombre'),
    this.lastName = const BlocFormItem(error: 'Ingrese el apellido'),
    this.email = const BlocFormItem(error: 'Ingrese el email'),
    this.phone = const BlocFormItem(error: 'Ingrese el telefono'),
    this.password = const BlocFormItem(error: 'Ingrese el contraseña'),
    this.confirmPassword = const BlocFormItem(error: 'Confirma la contraseña'),
    this.formKey,
    this.response,
  });

  Registerstate copyWith({
    BlocFormItem? name,
    BlocFormItem? lastName,
    BlocFormItem? email,
    BlocFormItem? phone,
    BlocFormItem? password,
    BlocFormItem? confirmPassword,
    Resource? response,
    GlobalKey<FormState>? formKey,
  }) {

    return Registerstate(
      name: name ?? this.name,
      lastName: lastName?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formKey: formKey ,
      response:  response,

    )
  }

  @override
  List<Object?> get props => [
    name,
    lastName,
    email,
    phone,
    password,
    confirmPassword,
    response,
  ];
}
