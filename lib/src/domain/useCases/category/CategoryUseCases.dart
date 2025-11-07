import 'package:ecommerce_flutter/src/domain/useCases/category/CreateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/category/DeleteCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/category/GetCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/category/UpdateCategoryUseCase.dart';

class CategoryUseCases {
  CreateCategoryUseCase create;
  GetCategoryUseCase getCategory;
  UpdateCategoryUseCase update;
  DeleteCategoryUseCase delete;
  CategoryUseCases({
    required this.create,
    required this.getCategory,
    required this.update,
    required this.delete,
  });
}
