import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategoryRepository.dart';

class CreateCategoryUseCase {
  CategoryRepository categoryRepository;

  CreateCategoryUseCase(this.categoryRepository);

  run(Category category, File file) =>
      categoryRepository.craete(category, file);
}
