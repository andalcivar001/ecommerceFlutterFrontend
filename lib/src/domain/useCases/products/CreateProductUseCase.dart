import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/repository/ProductRepository.dart';

class CreateProductUseCase {
  ProductRepository productRepository;

  CreateProductUseCase(this.productRepository);

  run(Product product, List<File> images) =>
      productRepository.create(product, images);
}
