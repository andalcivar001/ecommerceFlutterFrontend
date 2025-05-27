import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBlocCubit extends Cubit<LoginBlocState> {
  LoginBlocCubit() : super(LoginInitial());
  // Aquí puedes agregar métodos para manejar eventos y estados
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Getters para acceder a los streams
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  // Metodos para acceder a los valores actuales
  void changeEmail(String email) {
    if (email.isNotEmpty && email.length < 3) {
      _emailController.sink.addError('Email no válido');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changePassword(String password) {
    if (password.isNotEmpty && password.length < 3) {
      _passwordController.sink.addError('Debe tener al menos 3 caracteres');
    } else {
      _passwordController.sink.add(password);
    }
  }

  // si pasa las 2 validaciones entonces el formulario es valido
  Stream<bool> get validateForm => Rx.combineLatest2(
    _emailController.stream,
    _passwordController.stream,
    (a, b) => true,
  );

  //cuando pasamos a la siguiente pantalla
  void dispose() {
    changeEmail('');
    changePassword('');
  }

  void login() {
    print('email: ${_emailController.value}');
    print('password: ${_passwordController.value}');
  }
}
