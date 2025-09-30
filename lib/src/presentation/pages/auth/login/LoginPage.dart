import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginBlocCubit.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginResponse.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBlocCubit?
  _loginBlocCubit; // para definir variables privadas se pone un guion bajo

  @override
  // se ejeucta por primera vez cuando se muestre la pantalla y solo se dispara una  unica vez
  void initState() {
    super.initState();
    // se asegura que los strings tengan un valor vacio
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _loginBlocCubit?.dispose();
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  //el metodo build se ejecuta cuadno guardamos
  Widget build(BuildContext context) {
    _loginBlocCubit = BlocProvider.of<LoginBlocCubit>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity, // para ocupar todo el ancho
        child: Stack(
          // Coloca un elemento encima de otro
          alignment: Alignment.center,
          children: [
            LoginResponse(_loginBlocCubit),
            LoginContent(_loginBlocCubit),
          ],
        ),
      ),
    );
  }
}
