import 'package:ecommerce_flutter/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ClientPaymentFormState extends Equatable {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final String? identificationType;
  final String identificationNumber;
  final bool isCvvFocused;
  final GlobalKey<FormState>? formKey;
  final List<MercadoPagoIdentificationType>? identificationTypes;

  const ClientPaymentFormState({
    this.cardNumber = '',
    this.expiryDate = '',
    this.cardHolderName = '',
    this.cvvCode = '',
    this.isCvvFocused = false,
    this.formKey,
    this.identificationTypes = const [],
    this.identificationType,
    this.identificationNumber = '',
  });

  ClientPaymentFormState copyWith({
    String? cardNumber,
    String? expiryDate,
    String? cardHolderName,
    String? cvvCode,
    bool? isCvvFocused,
    GlobalKey<FormState>? formKey,
    List<MercadoPagoIdentificationType>? identificationTypes,
    String? identificationType,
    String? identificationNumber,
  }) {
    return ClientPaymentFormState(
      cardNumber: cardNumber ?? this.cardNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cvvCode: cvvCode ?? this.cvvCode,
      isCvvFocused: isCvvFocused ?? this.isCvvFocused,
      formKey: formKey,
      identificationTypes: identificationTypes ?? this.identificationTypes,
      identificationType: identificationType ?? this.identificationType,
      identificationNumber: identificationNumber ?? this.identificationNumber,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    cardNumber,
    expiryDate,
    cardHolderName,
    cvvCode,
    isCvvFocused,
    identificationTypes,
    identificationType,
    identificationNumber,
  ];
}
