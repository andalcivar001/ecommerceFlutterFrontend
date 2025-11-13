import 'dart:io';

import 'package:ecommerce_flutter/src/data/dataSource/remote/services/ProductService.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/repository/ProductRepository.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductService productService;

  ProductRepositoryImpl(this.productService);
  @override
  Future<Resource<Product>> create(Product product, List<File> images) {
    return productService.create(product, images);
  }

  @override
  Future<Resource<List<Product>>> getProductsByCategory(String idCategory) {
    return productService.getProductsByCategory(idCategory);
  }
}
