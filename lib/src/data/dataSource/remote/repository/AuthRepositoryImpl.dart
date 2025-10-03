import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class Authrepositoryimpl implements Authrepository {
  AuthService authService;

  Authrepositoryimpl(this.authService);

  @override
  Future<Resource> login(String email, String password) {
    return authService.login(email, password);
  }

  @override
  Future<Resource> register(User user) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
