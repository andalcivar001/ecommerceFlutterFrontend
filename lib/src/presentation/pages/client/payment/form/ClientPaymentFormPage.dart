import 'package:ecommerce_flutter/src/presentation/pages/client/payment/form/CientPaymentFormContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/payment/form/bloc/ClientPaymentFormBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/payment/form/bloc/ClientPaymentFormEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/payment/form/bloc/ClientPaymentFormState.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientPaymentFormPage extends StatefulWidget {
  const ClientPaymentFormPage({super.key});

  @override
  State<ClientPaymentFormPage> createState() => _ClientPaymentFormPageState();
}

class _ClientPaymentFormPageState extends State<ClientPaymentFormPage> {
  ClientPaymentFormBloc? bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<ClientPaymentFormBloc>(context);
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 15, left: 30, right: 30),
        child: DefaultButton(
          text: 'Continuar',
          onPressed: () {
            bloc?.add(FormSubmitCreditCard());
          },
          color: Colors.blueAccent,
        ),
      ),
      body: BlocBuilder<ClientPaymentFormBloc, ClientPaymentFormState>(
        builder: (context, state) {
          return ClientPaymentFormContent(bloc, state);
        },
      ),
    );
  }
}
