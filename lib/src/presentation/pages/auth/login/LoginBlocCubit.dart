import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBlocCubit extends Cubit<LoginBlocState> {
  AuthUseCases authUseCases;
  LoginBlocCubit(this.authUseCases) : super(LoginInitial());

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _responseController = BehaviorSubject<Resource>();

  // Getters para acceder a los streams
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<Resource> get responseStream => _responseController.stream;

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

  void login() async {
    _responseController.add(Loading());
    Resource response = await authUseCases.login.run(
      _emailController.value,
      _passwordController.value,
    );
    _responseController.add(response);
    Future.delayed(Duration(seconds: 1), () {
      _responseController.add(Initial());
    });
  }
}
