import 'dart:io';

import 'package:ecommerce_flutter/src/data/dataSource/remote/services/CategoryService.dart';
import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategoryRepository.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  CategoryService categoryService;

  CategoryRepositoryImpl(this.categoryService);

  @override
  Future<Resource<Category>> craete(Category category, File file) {
    return categoryService.create(category, file);
  }

  @override
  Future<Resource<List<Category>>> getCategories() {
    return categoryService.getCategories();
  }

  @override
  Future<Resource<Category>> update(int id, Category category, File file) {
    return categoryService.update(id, category, file);
  }
}
