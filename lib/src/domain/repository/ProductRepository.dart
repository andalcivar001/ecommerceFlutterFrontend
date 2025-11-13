import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

abstract class ProductRepository {
  Future<Resource<Product>> create(Product product, List<File> images);
  Future<Resource<List<Product>>> getProductsByCategory(String idCategory);
}
