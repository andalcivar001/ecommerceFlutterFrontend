import 'package:ecommerce_flutter/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:ecommerce_flutter/src/domain/useCases/MercadoPago/MercadoPagoUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/payment/form/bloc/ClientPaymentFormEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/payment/form/bloc/ClientPaymentFormState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientPaymentFormBloc
    extends Bloc<ClientPaymentFormEvent, ClientPaymentFormState> {
  MercadoPagoUseCases mercadoPagoUseCases;
  ClientPaymentFormBloc(this.mercadoPagoUseCases)
    : super(ClientPaymentFormState()) {
    on<ClientPaymentFormInitEvent>(_onInit);
    on<CreditCardChanged>(_onCreditCart);
    on<FormSubmitCreditCard>(_onFormSubmitted);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInit(
    ClientPaymentFormInitEvent event,
    Emitter<ClientPaymentFormState> emit,
  ) async {
    Resource response = await mercadoPagoUseCases.getIdentificationTypes.run();
    emit(state.copyWith(formKey: formKey));

    if (response is Success) {
      List<MercadoPagoIdentificationType> identificationTypes = response.data;
      identificationTypes.forEach(
        (element) => {print('ELEMENT ${element.toJson()}')},
      );
      emit(
        state.copyWith(
          identificationTypes: identificationTypes,
          formKey: formKey,
        ),
      );
    }
  }

  Future<void> _onCreditCart(
    CreditCardChanged event,
    Emitter<ClientPaymentFormState> emit,
  ) async {
    emit(
      state.copyWith(
        cardNumber: event.cardNumber,
        expiryDate: event.expiryDate,
        cardHolderName: event.cardHolderName,
        cvvCode: event.cvvCode,
        isCvvFocused: event.isCvvFocused,
        formKey: formKey,
      ),
    );
  }

  Future<void> _onFormSubmitted(
    FormSubmitCreditCard event,
    Emitter<ClientPaymentFormState> emit,
  ) async {
    print('cardNumber ${state.cardNumber}');
    print('cardHolderName ${state.cardHolderName}');
    print('state.cvvCode ${state.cvvCode}');
    print('state.expiryDate ${state.expiryDate}');
    print('state.isCvvFocused ${state.isCvvFocused}');
  }
}
