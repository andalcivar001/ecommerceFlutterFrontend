import 'package:ecommerce_flutter/src/domain/repository/ProductRepository.dart';

class DeleteProductUseCase {
  ProductRepository productRepository;

  DeleteProductUseCase(this.productRepository);

  run(int id) => productRepository.delete(id);
}
