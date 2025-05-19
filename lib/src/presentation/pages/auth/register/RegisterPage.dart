import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultTextField.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefualtIconBack.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
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
                    Icon(
                      Icons.person_add_alt_1,
                      color: Colors.white,
                      size: 120,
                    ),
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
                      child: DefaultTextfield(
                        label: 'Nombres',
                        icon: Icons.person,
                        onChanged: (text) {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextfield(
                        label: 'Apellidos',
                        icon: Icons.person,
                        onChanged: (text) {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextfield(
                        label: 'Email',
                        icon: Icons.email,
                        onChanged: (text) {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextfield(
                        label: 'Teléfono',
                        icon: Icons.phone,
                        onChanged: (text) {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextfield(
                        label: 'Contraseña',
                        icon: Icons.lock,
                        onChanged: (text) {},
                        isPassword: true,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: DefaultTextfield(
                        label: 'Confirmar Contraseña',
                        icon: Icons.lock_outline,
                        onChanged: (text) {},
                        isPassword: true,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: DefaultButton(
                        text: 'REGISTRATE',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DefualtIconBack(marginLeft: 50, marginTop: 155),
          ],
        ),
      ),
    );
  }
}
