import 'package:ecommerce_flutter/src/data/dataSource/remote/repository/AuthRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Appmodule {
  @injectable
  AuthService get authService => AuthService();

  @injectable
  Authrepository get authrepository => Authrepositoryimpl(authService);

  @injectable
  AuthUseCases get authuseCases => AuthUseCases(
    login: LoginUseCase(authrepository),
    register: RegisterUseCase(authrepository),
  );
}
