import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthUseCases authUseCases;
  LoginBloc(this.authUseCases) : super(LoginState()) {
    on<InitEvent>(_onInitEvent);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginFormReset>(_onLoginFormReset);
    on<LoginSaveUserSession>(_onLoginSaveUserSession);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(InitEvent event, Emitter<LoginState> emit) async {
    AuthResponse? authResponse = authUseCases.getUserSession.run();
    print('usuario de sesion ${authResponse?.toJson()}');
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onLoginSaveUserSession(
    LoginSaveUserSession event,
    Emitter<LoginState> emit,
  ) async {
    await authUseCases.saveUserSession.run(event.authResponse);
  }

  Future<void> _onLoginFormReset(
    LoginFormReset event,
    Emitter<LoginState> emit,
  ) async {
    state.formKey?.currentState?.reset();
  }

  Future<void> _onEmailChanged(
    EmailChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(
        email: BlocFormItem(
          value: event.email.value,
          error: event.email.value.isNotEmpty ? null : 'Ingresa un email',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onPasswordChanged(
    PasswordChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(
        password: BlocFormItem(
          value: event.password.value,
          error:
              event.password.value.isNotEmpty &&
                      event.password.value.length >= 4
                  ? null
                  : 'Ingrese Contraseña',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));
    await Future.delayed(Duration(seconds: 3));
    Resource<AuthResponse> response = await authUseCases.login.run(
      state.email.value,
      state.password.value,
    );
    emit(state.copyWith(response: response, formKey: formKey));
  }

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _responseController = BehaviorSubject<Resource>();

  // Getters para acceder a los streams
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<Resource> get responseStream => _responseController.stream;

  // si pasa las 2 validaciones entonces el formulario es valido
  Stream<bool> get validateForm => Rx.combineLatest2(
    _emailController.stream,
    _passwordController.stream,
    (a, b) => true,
  );

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
