import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/CategoryService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/UserService.dart';
import 'package:ecommerce_flutter/src/data/repository/AuthRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_flutter/src/data/repository/CategoryRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/repository/UserRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategoryRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/UserRepositoy.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/GetUSerSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/SaveUSerSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/category/CategoryUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/category/CreateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/category/DeleteCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/category/GetCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/category/UpdateCategoryUseCase.dart';
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
  UserService get userService => UserService(sharedPref);

  @injectable
  CategoryService get categoryService => CategoryService(sharedPref);

  @injectable
  AuthRepository get authrepository =>
      Authrepositoryimpl(authService, sharedPref);

  @injectable
  UserRepository get userRepository => UserRepositoryImpl(userService);

  @injectable
  CategoryRepository get categoryRepository =>
      CategoryRepositoryImpl(categoryService);

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

  @injectable
  CategoryUseCases get categoryUseCases => CategoryUseCases(
    create: CreateCategoryUseCase(categoryRepository),
    getCategory: GetCategoryUseCase(categoryRepository),
    update: UpdateCategoryUseCase(categoryRepository),
    delete: DeleteCategoryUseCase(categoryRepository),
  );
}
