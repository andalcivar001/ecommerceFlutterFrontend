import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ClientPaymentFormEvent extends Equatable {
  const ClientPaymentFormEvent();
  @override
  List<Object?> get props => [];
}

class ClientPaymentFormInitEvent extends ClientPaymentFormEvent {
  const ClientPaymentFormInitEvent();
}

class CreditCardChanged extends ClientPaymentFormEvent {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool isCvvFocused;

  const CreditCardChanged({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.isCvvFocused,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    cardNumber,
    cardHolderName,
    expiryDate,
    cvvCode,
    isCvvFocused,
  ];
}

class FormSubmitCreditCard extends ClientPaymentFormEvent {
  const FormSubmitCreditCard();
}

class IdentificationTypeChanged extends ClientPaymentFormEvent {
  final String identificationType;
  const IdentificationTypeChanged({required this.identificationType});
  @override
  // TODO: implement props
  List<Object?> get props => [identificationType];
}

class IdentificationNumberChanged extends ClientPaymentFormEvent {
  final String identificationNumber;
  const IdentificationNumberChanged({required this.identificationNumber});
  @override
  // TODO: implement props
  List<Object?> get props => [identificationNumber];
}
