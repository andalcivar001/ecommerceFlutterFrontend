import 'package:ecommerce_flutter/src/domain/repository/CategoryRepository.dart';

class GetCategoryUseCase {
  CategoryRepository categoryRepository;
  GetCategoryUseCase(this.categoryRepository);
  run() => categoryRepository.getCategories();
}
