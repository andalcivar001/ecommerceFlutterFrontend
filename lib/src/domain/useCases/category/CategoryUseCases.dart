import 'package:ecommerce_flutter/src/domain/useCases/category/CreateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/category/GetCategoryUseCase.dart';

class CategoryUseCases {
  CreateCategoryUseCase create;
  GetCategoryUseCase getCategory;

  CategoryUseCases({required this.create, required this.getCategory});
}
