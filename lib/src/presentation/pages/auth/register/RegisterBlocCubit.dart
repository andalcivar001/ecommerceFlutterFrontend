import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBlocCubit extends Cubit<RegisterBlocState> {
  AuthUseCases authUseCases;
  RegisterBlocCubit(this.authUseCases) : super(RegisterInitial());

  final _nombreController = BehaviorSubject<String>();
  final _apellidoController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _telefonoController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();
  final _responseController = BehaviorSubject<Resource>();

  Stream<String> get nombreStream => _nombreController.stream;
  Stream<String> get apellidoStream => _apellidoController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get telefonoStream => _telefonoController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get confirmPasswordStream => _confirmPasswordController.stream;
  Stream<Resource> get responseStream => _responseController.stream;

  Stream<bool> get validateForm => Rx.combineLatest6(
    nombreStream,
    apellidoStream,
    emailStream,
    telefonoStream,
    passwordStream,
    confirmPasswordStream,
    (a, b, c, d, e, f) => true,
  );

  toUser() => User(
    name: _nombreController.value,
    lastName: _apellidoController.value,
    email: _emailController.value,
    phone: _telefonoController.value,
    password: _passwordController.value,
  );

  void register() async {
    _responseController.add(Loading());
    Resource<AuthResponse> response = await authUseCases.register.run(toUser());
    _responseController.add(response);
    Future.delayed(Duration(seconds: 1), () {
      _responseController.add(Initial());
    });
  }

  void changeNombre(String nombre) {
    if (nombre.isNotEmpty && nombre.length < 2) {
      _nombreController.sink.addError(
        'El nombre es muy corto, debe tener mas de 2 caracteres',
      );
    } else {
      _nombreController.sink.add((nombre));
    }
  }

  void changeApellidos(String apellido) {
    if (apellido.isNotEmpty && apellido.length < 2) {
      _apellidoController.sink.addError(
        'El apellido es muy corto, debe tener mas de 2 caracteres',
      );
    } else {
      _apellidoController.sink.add((apellido));
    }
  }

  void changeEmail(String email) {
    bool emailFormatValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
    if (email.isNotEmpty && email.length < 5) {
      _emailController.sink.addError('Al menos 5 caracteres');
    } else if (email.isNotEmpty && !emailFormatValid) {
      _emailController.sink.addError('El email no es valido');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changeTelefono(String telefono) {
    if (telefono.isNotEmpty && telefono.length < 6) {
      _telefonoController.sink.addError('No es un teláfono válido');
    } else {
      _telefonoController.sink.add((telefono));
    }
  }

  void changePassword(String password) {
    if (password.isNotEmpty && password.length < 3) {
      _passwordController.sink.addError(
        'La contraseña debe tener mas de 3 caracteres',
      );
    } else {
      _passwordController.sink.add((password));
    }
  }

  void changeConfirmPassword(String confirmPassword) {
    if (confirmPassword.isNotEmpty && confirmPassword.length < 3) {
      _confirmPasswordController.sink.addError(
        'La confirmacion de contraseña debe tener mas de 3 caracteres',
      );
    } else {
      if (confirmPassword != _passwordController.value) {
        _confirmPasswordController.sink.addError(
          'Las contraseñas no coinciden',
        );
      } else {
        _confirmPasswordController.sink.add((confirmPassword));
      }
    }
  }

  void dispose() {
    changeNombre('');
    changeApellidos('');
    changeEmail('');
    changeTelefono('');
    changePassword('');
    changeConfirmPassword('');
  }
}
