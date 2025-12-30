// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart'
    as _i838;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AddressService.dart'
    as _i993;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart'
    as _i543;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/CategoryService.dart'
    as _i632;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/MercadoPagoService.dart'
    as _i282;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/ProductService.dart'
    as _i463;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/UserService.dart'
    as _i429;
import 'package:ecommerce_flutter/src/di/appModule.dart' as _i896;
import 'package:ecommerce_flutter/src/domain/repository/AddressRepository.dart'
    as _i879;
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart'
    as _i148;
import 'package:ecommerce_flutter/src/domain/repository/CategoryRepository.dart'
    as _i285;
import 'package:ecommerce_flutter/src/domain/repository/MercadoPagoRepository.dart'
    as _i1023;
import 'package:ecommerce_flutter/src/domain/repository/ProductRepository.dart'
    as _i299;
import 'package:ecommerce_flutter/src/domain/repository/ShoppingBagRepository.dart'
    as _i747;
import 'package:ecommerce_flutter/src/domain/repository/UserRepositoy.dart'
    as _i6;
import 'package:ecommerce_flutter/src/domain/useCases/Address/AddressUseCases.dart'
    as _i742;
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart'
    as _i322;
import 'package:ecommerce_flutter/src/domain/useCases/category/CategoryUseCases.dart'
    as _i967;
import 'package:ecommerce_flutter/src/domain/useCases/MercadoPago/MercadoPagoUseCases.dart'
    as _i410;
import 'package:ecommerce_flutter/src/domain/useCases/products/ProductUseCases.dart'
    as _i778;
import 'package:ecommerce_flutter/src/domain/useCases/shoppingBag/ShoppingBagUseCases.dart'
    as _i190;
import 'package:ecommerce_flutter/src/domain/useCases/users/UsersUseCases.dart'
    as _i525;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appmodule = _$Appmodule();
    gh.factory<_i543.AuthService>(() => appmodule.authService);
    gh.factoryAsync<String>(() => appmodule.token);
    gh.factory<_i838.SharedPref>(() => appmodule.sharedPref);
    gh.factory<_i429.UserService>(() => appmodule.userService);
    gh.factory<_i632.CategoryService>(() => appmodule.categoryService);
    gh.factory<_i463.ProductService>(() => appmodule.productService);
    gh.factory<_i993.AddressService>(() => appmodule.addressService);
    gh.factory<_i282.MercadoPagoService>(() => appmodule.mercadoPagoService);
    gh.factory<_i148.AuthRepository>(() => appmodule.authrepository);
    gh.factory<_i6.UserRepository>(() => appmodule.userRepository);
    gh.factory<_i285.CategoryRepository>(() => appmodule.categoryRepository);
    gh.factory<_i299.ProductRepository>(() => appmodule.productRepository);
    gh.factory<_i747.ShoppingBagRepository>(
      () => appmodule.shoppingBagRepository,
    );
    gh.factory<_i879.AddressRepository>(() => appmodule.addressRepository);
    gh.factory<_i1023.MercadoPagoRepository>(
      () => appmodule.mercadoPagoRepository,
    );
    gh.factory<_i322.AuthUseCases>(() => appmodule.authuseCases);
    gh.factory<_i525.UsersUseCases>(() => appmodule.usersUseCases);
    gh.factory<_i967.CategoryUseCases>(() => appmodule.categoryUseCases);
    gh.factory<_i778.ProductUseCases>(() => appmodule.productUseCases);
    gh.factory<_i190.ShoppingBagUseCases>(() => appmodule.shoppingBagUseCases);
    gh.factory<_i742.AddressUseCases>(() => appmodule.addressUseCases);
    gh.factory<_i410.MercadoPagoUseCases>(() => appmodule.mercadoPagoUseCases);
    return this;
  }
}

class _$Appmodule extends _i896.Appmodule {}
