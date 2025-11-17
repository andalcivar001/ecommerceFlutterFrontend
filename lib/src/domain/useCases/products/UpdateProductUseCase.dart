import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/repository/ProductRepository.dart';

class UpdateProductUseCase {
  ProductRepository productRepository;

  UpdateProductUseCase(this.productRepository);

  run(int id, Product product, List<File>? images, List<int>? imagesToUpdate) =>
      productRepository.udpate(id, product, images, imagesToUpdate);
}
