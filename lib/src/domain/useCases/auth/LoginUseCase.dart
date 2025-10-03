import 'package:ecommerce_flutter/src/data/dataSource/remote/repository/AuthRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';

class LoginUseCase {
  Authrepository authrepository = Authrepositoryimpl();
  run(String email, String password) => authrepository.login(email, password);
}
