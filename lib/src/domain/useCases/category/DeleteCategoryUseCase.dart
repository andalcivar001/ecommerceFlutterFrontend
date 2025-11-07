import 'package:ecommerce_flutter/src/domain/repository/CategoryRepository.dart';

class DeleteCategoryUseCase {
  CategoryRepository categoryRepository;

  DeleteCategoryUseCase(this.categoryRepository);

  run(int id) => categoryRepository.delete(id);
}
