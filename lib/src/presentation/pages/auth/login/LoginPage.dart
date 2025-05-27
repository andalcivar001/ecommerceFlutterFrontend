import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginBlocCubit.dart';
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
            Image.asset(
              'assets/img/background2.jpg',
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
                    child: StreamBuilder(
                      stream: _loginBlocCubit!.emailStream,
                      builder: (context, snapshot) {
                        return DefaultTextfield(
                          label: 'Correo electrónico',
                          icon: Icons.email,
                          errorText: snapshot.error?.toString(),
                          onChanged: (text) {
                            _loginBlocCubit!.changeEmail(text);
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: StreamBuilder(
                      stream: _loginBlocCubit!.passwordStream,
                      builder: (context, snapshot) {
                        return DefaultTextfield(
                          label: 'Contraseña',
                          icon: Icons.lock,
                          errorText: snapshot.error?.toString(),
                          onChanged: (text) {
                            _loginBlocCubit!.changePassword(text);
                          },
                          isPassword: true,
                        );
                      },
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
                    child: StreamBuilder(
                      stream: _loginBlocCubit!.validateForm,
                      builder: (context, snapshot) {
                        return ElevatedButton(
                          onPressed: () {
                            if (snapshot.hasData) {
                              _loginBlocCubit?.login();
                            } else {
                              Fluttertoast.showToast(
                                msg: 'Formulario inválido',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                snapshot.hasData
                                    ? Colors.green
                                    : Colors
                                        .grey, // Cambia el color del botón según el estado del formulario
                          ),
                          child: Text(
                            'INICIAR SESION',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
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
      ),
    );
  }
}
