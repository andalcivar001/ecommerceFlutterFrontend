import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultTextField.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefualtIconBack.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registercontent extends StatelessWidget {
  RegisterBlocCubit? bloc;

  Registercontent(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,

      children: [
        Image.asset(
          'assets/img/background2.jpg',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
          color: Color.fromRGBO(0, 0, 0, 0.7),
          colorBlendMode: BlendMode.darken,
        ),

        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.70,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.3),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Icon(Icons.person_add_alt_1, color: Colors.white, size: 120),
                Text(
                  'REGISTRO',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: StreamBuilder(
                    stream: bloc?.nombreStream,
                    builder: (context, snapshot) {
                      return DefaultTextfield(
                        label: 'Nombres',
                        icon: Icons.person,
                        errorText: snapshot.error?.toString(),
                        onChanged: (text) {
                          bloc?.changeNombre(text);
                        },
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: StreamBuilder(
                    stream: bloc?.apellidoStream,
                    builder: (context, snapshot) {
                      return DefaultTextfield(
                        label: 'Apellidos',
                        icon: Icons.person,
                        errorText: snapshot.error?.toString(),
                        onChanged: (text) {
                          bloc?.changeApellidos(text);
                        },
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: StreamBuilder(
                    stream: bloc?.emailStream,
                    builder: (context, snapshot) {
                      return DefaultTextfield(
                        label: 'Email',
                        icon: Icons.email,
                        errorText: snapshot.error?.toString(),
                        onChanged: (text) {
                          bloc?.changeEmail(text);
                        },
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: StreamBuilder(
                    stream: bloc?.telefonoStream,
                    builder: (context, snapshot) {
                      return DefaultTextfield(
                        label: 'Teléfono',
                        icon: Icons.phone,
                        errorText: snapshot.error?.toString(),
                        onChanged: (text) {
                          bloc?.changeTelefono(text);
                        },
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: StreamBuilder(
                    stream: bloc?.passwordStream,
                    builder: (context, snapshot) {
                      return DefaultTextfield(
                        label: 'Contraseña',
                        icon: Icons.lock,
                        errorText: snapshot.error?.toString(),
                        onChanged: (text) {
                          bloc?.changePassword(text);
                        },
                        isPassword: true,
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: StreamBuilder(
                    stream: bloc?.confirmPasswordStream,
                    builder: (context, snapshot) {
                      return DefaultTextfield(
                        label: 'Confirmar Contraseña',
                        icon: Icons.lock_outline,
                        errorText: snapshot.error?.toString(),
                        onChanged: (text) {
                          bloc?.changeConfirmPassword(text);
                        },
                        isPassword: true,
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                  child: StreamBuilder(
                    stream: bloc?.validateForm,
                    builder: (context, snapshot) {
                      return DefaultButton(
                        text: 'REGISTRATE',
                        color: snapshot.hasData ? Colors.black : Colors.grey,
                        onPressed: () {
                          if (snapshot.hasData) {
                            bloc?.register();
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        DefualtIconBack(marginLeft: 50, marginTop: 155),
      ],
    );
  }
}
