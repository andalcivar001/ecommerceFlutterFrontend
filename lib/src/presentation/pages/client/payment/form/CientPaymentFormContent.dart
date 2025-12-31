import 'package:ecommerce_flutter/src/presentation/pages/client/payment/form/bloc/ClientPaymentFormBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/payment/form/bloc/ClientPaymentFormEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/payment/form/bloc/ClientPaymentFormState.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class ClientPaymentFormContent extends StatelessWidget {
  ClientPaymentFormBloc? bloc;
  ClientPaymentFormState state;

  ClientPaymentFormContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _creditCardWdiget(),
        _creditCardForm(),
        _dropDownIdentificationTypes(),
        _textFieldIdentifitionNumber(),
      ],
    );
  }

  Widget _textFieldIdentifitionNumber() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5),
      child: DefaultTextField(
        label: 'Numero de identificación',
        icon: Icons.document_scanner,
        onChanged: (text) {
          bloc?.add(IdentificationNumberChanged(identificationNumber: text));
        },
        color: Colors.grey,
      ),
    );
  }

  Widget _dropDownIdentificationTypes() {
    return Container(
      margin: EdgeInsets.only(left: 17, right: 17, top: 5),
      child: DropdownButton(
        hint: Text(
          'Tipo de Identificacion',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),

        items: _dropDownItems(),
        value: state.identificationType,
        onChanged: (value) {
          bloc?.add(IdentificationTypeChanged(identificationType: value!));
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropDownItems() {
    List<DropdownMenuItem<String>> list = [];
    state.identificationTypes!.forEach((x) {
      list.add(
        DropdownMenuItem(
          child: Container(
            margin: EdgeInsets.only(top: 7),
            child: Text(x.name),
          ),
          value: x.id,
        ),
      );
    });
    return list;
  }

  Widget _creditCardForm() {
    return CreditCardForm(
      formKey: state.formKey ?? GlobalKey<FormState>(), // Required
      cardNumber: state.cardNumber, // Required
      expiryDate: state.expiryDate, // Required
      cardHolderName: state.cardHolderName, // Required
      cvvCode: state.cvvCode, // Required
      onCreditCardModelChange: (CreditCardModel data) {
        bloc?.add(
          CreditCardChanged(
            cardNumber: data.cardNumber,
            expiryDate: data.expiryDate,
            cardHolderName: data.cardHolderName,
            cvvCode: data.cvvCode,
            isCvvFocused: data.isCvvFocused,
          ),
        );
      }, // Required
      obscureCvv: true,
      obscureNumber: true,
      isHolderNameVisible: true,
      isCardNumberVisible: true,
      isExpiryDateVisible: true,
      enableCvv: true,
      cvvValidationMessage: 'Please input a valid CVV',
      dateValidationMessage: 'Please input a valid date',
      numberValidationMessage: 'Please input a valid number',
      cardNumberValidator: (String? cardNumber) {},
      expiryDateValidator: (String? expiryDate) {},
      cvvValidator: (String? cvv) {},
      cardHolderValidator: (String? cardHolderName) {},
      isCardHolderNameUpperCase: true,
      onFormComplete: () {
        // callback to execute at the end of filling card data
      },
      autovalidateMode: AutovalidateMode.always,
      disableCardNumberAutoFillHints: false,
      inputConfiguration: const InputConfiguration(
        cardNumberDecoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Numero de la tarjeta',
          hintText: 'XXXX XXXX XXXX XXXX',
        ),
        expiryDateDecoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Fecha de expiracion',
          hintText: 'XX/XX',
        ),
        cvvCodeDecoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'CVV',
          hintText: 'XXX',
        ),
        cardHolderDecoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Propietario',
        ),
        cardNumberTextStyle: TextStyle(fontSize: 10, color: Colors.black),
        cardHolderTextStyle: TextStyle(fontSize: 10, color: Colors.black),
        expiryDateTextStyle: TextStyle(fontSize: 10, color: Colors.black),
        cvvCodeTextStyle: TextStyle(fontSize: 10, color: Colors.black),
      ),
    );
  }

  Widget _creditCardWdiget() {
    return CreditCardWidget(
      cardNumber: state.cardNumber,
      expiryDate: state.expiryDate,
      cardHolderName: state.cardHolderName,
      cvvCode: state.cvvCode,
      showBackView:
          state.isCvvFocused, //true when you want to show cvv(back) view
      onCreditCardWidgetChange:
          (
            CreditCardBrand brand,
          ) {}, // Callback for anytime credit card brand is changed
    );
  }
}
