import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';

class RegisterUseCase {
  Authrepository repository;
  RegisterUseCase(this.repository);
  run(User user) => repository.register(user);
}
