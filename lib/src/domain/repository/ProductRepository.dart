import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

abstract class ProductRepository {
  Future<Resource<Product>> create(Product product, List<File> images);
  Future<Resource<List<Product>>> getProductsByCategory(int idCategory);
  Future<Resource<Product>> udpate(
    int id,
    Product product,
    List<File>? images,
    List<int>? imagesToUpdate,
  );

  Future<Resource<bool>> delete(int id);
}
