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
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart'
    as _i543;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/UserService.dart'
    as _i429;
import 'package:ecommerce_flutter/src/di/appModule.dart' as _i896;
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart'
    as _i148;
import 'package:ecommerce_flutter/src/domain/repository/UserRepositoy.dart'
    as _i6;
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart'
    as _i322;
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
    gh.factory<_i838.SharedPref>(() => appmodule.sharedPref);
    gh.factory<_i429.UserService>(() => appmodule.userService);
    gh.factory<_i148.AuthRepository>(() => appmodule.authrepository);
    gh.factory<_i6.UserRepository>(() => appmodule.userRepository);
    gh.factory<_i322.AuthUseCases>(() => appmodule.authuseCases);
    gh.factory<_i525.UsersUseCases>(() => appmodule.usersUseCases);
    return this;
  }
}

class _$Appmodule extends _i896.Appmodule {}
