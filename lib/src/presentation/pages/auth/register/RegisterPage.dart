import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterResponse.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultTextField.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefualtIconBack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

// se utiliza StatefulWidget.. para reiniciar los controles o strings
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBlocCubit? _registerBlocCubit;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _registerBlocCubit?.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    _registerBlocCubit = BlocProvider.of<RegisterBlocCubit>(
      context,
      listen: false,
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Registercontent(_registerBlocCubit),
            RegisterResponse(_registerBlocCubit),
          ],
        ),
      ),
    );
  }
}
