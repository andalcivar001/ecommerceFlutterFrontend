import 'package:ecommerce_flutter/src/domain/useCases/products/CreateProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/DeleteProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/GetProductsByCategory.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/UpdateProductUseCase.dart';

class ProductUseCases {
  CreateProductUseCase create;
  GetProductsByCategory getProductsByCategory;
  UpdateProductUseCase update;
  DeleteProductUseCase delete;
  ProductUseCases({
    required this.create,
    required this.getProductsByCategory,
    required this.update,
    required this.delete,
  });
}
