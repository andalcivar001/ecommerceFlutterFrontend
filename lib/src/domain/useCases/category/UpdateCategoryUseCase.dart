import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategoryRepository.dart';

class UpdateCategoryUseCase {
  CategoryRepository categoryRepository;
  UpdateCategoryUseCase(this.categoryRepository);
  run(int id, Category category, File? file) =>
      categoryRepository.update(id, category, file);
}
