import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/CategoryService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/ProductService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/UserService.dart';
import 'package:ecommerce_flutter/src/data/repository/AuthRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_flutter/src/data/repository/CategoryRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/repository/ProductRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/repository/UserRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategoryRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/ProductRepository.dart';
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
import 'package:ecommerce_flutter/src/domain/useCases/products/CreateProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/DeleteProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/GetProductsByCategory.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/ProductUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/UpdateProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/users/UpdateUserUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/users/UsersUseCases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class Appmodule {
  @injectable
  AuthService get authService => AuthService();

  @injectable
  Future<String> get token async {
    String token = "";
    final userSesion = await sharedPref.read('user');
    if (userSesion != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSesion);
      token = authResponse.token;
    }
    return token;
  }

  @injectable
  SharedPref get sharedPref => SharedPref();

  @injectable
  UserService get userService => UserService(token);

  @injectable
  CategoryService get categoryService => CategoryService(token);

  @injectable
  ProductService get productService => ProductService(token);

  @injectable
  AuthRepository get authrepository =>
      Authrepositoryimpl(authService, sharedPref);

  @injectable
  UserRepository get userRepository => UserRepositoryImpl(userService);

  @injectable
  CategoryRepository get categoryRepository =>
      CategoryRepositoryImpl(categoryService);

  @injectable
  ProductRepository get productRepository =>
      ProductRepositoryImpl(productService);

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

  @injectable
  ProductUseCases get productUseCases => ProductUseCases(
    create: CreateProductUseCase(productRepository),
    getProductsByCategory: GetProductsByCategory(productRepository),
    update: UpdateProductUseCase(productRepository),
    delete: DeleteProductUseCase(productRepository),
  );
}
