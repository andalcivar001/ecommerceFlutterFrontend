import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

abstract class CategoryRepository {
  Future<Resource<Category>> craete(Category category, File file);
  Future<Resource<Category>> update(int id, Category category, File file);
  Future<Resource<List<Category>>> getCategories();
}
