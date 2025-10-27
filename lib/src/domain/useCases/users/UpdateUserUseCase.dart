import 'dart:io';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/repository/UserRepositoy.dart';

class UpdateUserUseCase {
  UserRepository userRepository;
  UpdateUserUseCase(this.userRepository);

  run(int id, User user, File? file) => userRepository.update(id, user, file);
}
