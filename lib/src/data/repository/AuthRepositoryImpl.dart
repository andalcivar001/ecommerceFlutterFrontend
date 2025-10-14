import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class Authrepositoryimpl implements AuthRepository {
  AuthService authService;
  SharedPref sharedPref;

  Authrepositoryimpl(this.authService, this.sharedPref);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    print('Authrepositoryimpl - register: $user');
    return authService.register(user);
  }

  @override
  Future<AuthResponse> getUserSession() async {
    AuthResponse authResponse = AuthResponse.fromJson(
      await sharedPref.read('user'),
    );
    return authResponse;
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    sharedPref.save('user', authResponse.toJson());
  }
}
