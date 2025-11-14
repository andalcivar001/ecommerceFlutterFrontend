import 'package:ecommerce_flutter/src/domain/repository/ProductRepository.dart';

class GetProductsByCategory {
  ProductRepository productRepository;

  GetProductsByCategory(this.productRepository);

  run(int idCategory) => productRepository.getProductsByCategory(idCategory);
}
