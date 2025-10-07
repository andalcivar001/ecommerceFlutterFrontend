import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginContent extends StatelessWidget {
  LoginBloc? _bloc;
  LoginContent(this._bloc);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Form(
          key: state.formKey,
          child: Stack(
            alignment: Alignment.center,

            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationX(3.1416),
                // Rotación en el eje Y (π rad = 180°)
                child: Image.asset(
                  'assets/img/background3.jpg',
                  width:
                      MediaQuery.of(
                        context,
                      ).size.width, // para ocupar todo el ancho
                  height:
                      MediaQuery.of(
                        context,
                      ).size.height, // para ocupar todo el alto
                  fit:
                      BoxFit
                          .cover, // para que la imagen ocupe todo el espacio de la pantalla
                  color: Colors.black54,
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.3),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .center, // para centrar de manera verticual
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .center, // para centra de manera  horizontal
                  children: [
                    Icon(Icons.person, color: Colors.white, size: 125),
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextfield(
                        label: 'Correo electrónico',
                        icon: Icons.email,
                        //   errorText: snapshot.error?.toString(),
                        onChanged: (text) {
                          _bloc?.add(
                            EmailChanged(email: BlocFormItem(value: text)),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextfield(
                        label: 'Contraseña',
                        icon: Icons.lock,
                        // errorText: snapshot.error?.toString(),
                        onChanged: (text) {
                          _bloc?.add(
                            PasswordChanged(
                              password: BlocFormItem(value: text),
                            ),
                          );
                        },
                        isPassword: true,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      margin: EdgeInsets.only(
                        left: 25,
                        right: 25,
                        top: 25,
                        bottom: 15,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          _bloc?.add(LoginSubmitted());
                          // if (snapshot.hasData) {
                          //   _bloc?.login();
                          // } else {
                          //   Fluttertoast.showToast(
                          //     msg: 'Formulario inválido',
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.BOTTOM,
                          //     timeInSecForIosWeb: 1,
                          //     backgroundColor: Colors.red,
                          //     textColor: Colors.white,
                          //     fontSize: 16.0,
                          //   );
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          // Cambia el color del botón según el estado del formulario
                        ),
                        child: Text(
                          'INICIAR SESION',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center, //centra la fila de manera horizontal( cuando no es row, centra la fila de manera vertical)

                      children: [
                        Container(
                          width: 65,
                          height: 1,
                          color: Colors.white,
                          margin: EdgeInsets.only(right: 5),
                        ),
                        Text(
                          'No tienes cuenta?',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        Container(
                          width: 65,
                          height: 1,
                          color: Colors.white,
                          margin: EdgeInsets.only(left: 5),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'register');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: Text(
                          'REGISTRATE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
