import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _bloc; // para definir variables privadas se pone un guion bajo

  @override
  // se ejeucta por primera vez cuando se muestre la pantalla y solo se dispara una  unica vez
  void initState() {
    super.initState();
    // se asegura que los strings tengan un valor vacio
    // WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    //   _bloc?.dispose();
    // });

    // TODO: implement initState
  }

  @override
  //el metodo build se ejecuta cuadno guardamos
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: Container(
        width: double.infinity, // para ocupar todo el ancho
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            final responseState = state.response;
            if (responseState is Error) {
              Fluttertoast.showToast(
                msg: responseState.message,
                toastLength: Toast.LENGTH_LONG,
              );
            } else if (responseState is Success) {
              _bloc?.add(LoginFormReset());
              Fluttertoast.showToast(
                msg: 'Login Exitoso',
                toastLength: Toast.LENGTH_LONG,
              );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return LoginContent(_bloc, state);
            },
          ),
        ),
      ),
    );
  }
}
