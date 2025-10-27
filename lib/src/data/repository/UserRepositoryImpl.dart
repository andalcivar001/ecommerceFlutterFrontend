import 'dart:io';

import 'package:ecommerce_flutter/src/data/dataSource/remote/services/UserService.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/repository/UserRepositoy.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class UserRepositoryImpl extends UserRepository {
  UserService userService;

  UserRepositoryImpl(this.userService);

  @override
  Future<Resource<User>> update(int id, User user, File? image) {
    if (image == null) {
      return userService.update(id, user);
    } else {
      return userService.updateImage(id, user, image);
    }
  }
}
