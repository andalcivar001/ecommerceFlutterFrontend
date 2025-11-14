import 'package:ecommerce_flutter/src/domain/useCases/products/CreateProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/products/GetProductsByCategory.dart';

class ProductUseCases {
  CreateProductUseCase create;
  GetProductsByCategory getProductsByCategory;

  ProductUseCases({required this.create, required this.getProductsByCategory});
}
