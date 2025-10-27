import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/UserService.dart';
import 'package:ecommerce_flutter/src/data/repository/AuthRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_flutter/src/data/repository/UserRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/UserRepositoy.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/GetUSerSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/SaveUSerSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/users/UpdateUserUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/users/UsersUseCases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Appmodule {
  @injectable
  AuthService get authService => AuthService();

  @injectable
  SharedPref get sharedPref => SharedPref();

  @injectable
  UserService get userService => UserService();

  @injectable
  AuthRepository get authrepository =>
      Authrepositoryimpl(authService, sharedPref);

  @injectable
  UserRepository get userRepository => UserRepositoryImpl(userService);

  @injectable
  AuthUseCases get authuseCases => AuthUseCases(
    login: LoginUseCase(authrepository),
    register: RegisterUseCase(authrepository),
    saveUserSession: SaveUserSessionUseCase(authrepository),
    getUserSession: GetUserSessionUseCase(authrepository),
    logout: LogoutUseCase(authrepository),
  );

  @injectable
  UsersUseCases get usersUseCases =>
      UsersUseCases(updateUser: UpdateUserUseCase(userRepository));
}
