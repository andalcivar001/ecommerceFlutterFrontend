import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultTextField.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultIconBack.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterContentCopy extends StatelessWidget {
  RegisterBloc? bloc;
  RegisterState state;

  RegisterContentCopy(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,

        children: [
          Image.asset(
            'assets/img/background3.jpg',
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
                    child: DefaultTextField(
                      label: 'Nombre',
                      icon: Icons.person,
                      onChanged: (text) {
                        bloc?.add(
                          RegisterNameChanged(name: BlocFormItem(value: text)),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Apellido',
                      icon: Icons.person,
                      onChanged: (text) {
                        bloc?.add(
                          RegisterLastNameChanged(
                            lastName: BlocFormItem(value: text),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Email',
                      icon: Icons.email,
                      onChanged: (text) {
                        bloc?.add(
                          RegisterEmailChanged(
                            email: BlocFormItem(value: text),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Teléfono',
                      icon: Icons.phone,
                      onChanged: (text) {
                        bloc?.add(
                          RegisterPhoneChanged(
                            phone: BlocFormItem(value: text),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Contraseña',
                      icon: Icons.lock,
                      onChanged: (text) {
                        bloc?.add(
                          RegisterPasswordChanged(
                            password: BlocFormItem(value: text),
                          ),
                        );
                      },
                      isPassword: true,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    child: DefaultTextField(
                      label: 'Confirmar Contraseña',
                      icon: Icons.lock_outline,
                      onChanged: (text) {
                        bloc?.add(
                          RegisterConfirmPasswordChanged(
                            confirmPassword: BlocFormItem(value: text),
                          ),
                        );
                      },
                      isPassword: true,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                    child: DefaultButton(
                      text: 'REGISTRATE',
                      color: Colors.black,
                      onPressed: () {
                        print(
                          'RegisterContent - onPressed - name:${state.name.value} lastName:${state.lastName.value} email:${state.email.value} phone:${state.phone.value} password:${state.password.value} confirmPassword:${state.confirmPassword.value}',
                        );
                        if (state.formKey!.currentState!.validate()) {
                          bloc?.add(RegisterFormSubmit());
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
                    ),
                  ),
                ],
              ),
            ),
          ),
          DefaultIconBack(marginLeft: 50, marginTop: 155),
        ],
      ),
    );
  }
}
