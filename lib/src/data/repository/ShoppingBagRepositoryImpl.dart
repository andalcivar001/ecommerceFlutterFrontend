import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/repository/ShoppingBagRepository.dart';
import 'package:injectable/injectable.dart';

class ShoppingBagRepositoryImpl implements ShoppingBagRepository {
  SharedPref sharedPref;

  ShoppingBagRepositoryImpl(this.sharedPref);

  @override
  Future<void> add(Product product) async {
    final data = await sharedPref.read('shopping_bag');
    List<Product> selectedProducts = [];
    if (data == null) {
      selectedProducts.add(product);
      await sharedPref.save('shopping_bag', selectedProducts);
    } else {
      selectedProducts = Product.fromJsonList(data).toList();
      int index = selectedProducts.indexWhere((p) => p.id == product.id);
      // el producto no existe en la bolsa
      if (index == -1) {
        if (product.quantity == null) {
          product.quantity ??= 1;
        }
        selectedProducts.add(product);
      } else {
        // si existe el producto dentro de la lista
        selectedProducts[index].quantity = product.quantity;
      }
      await sharedPref.save('shopping_bag', selectedProducts);
    }
  }

  @override
  Future<void> deleteItem(Product product) async {
    final data = await sharedPref.read('shopping_bag');
    if (data == null) {
      return;
    }
    List<Product> selectedProducts = Product.fromJsonList(data).toList();
    selectedProducts.removeWhere((p) => p.id == product.id);
    await sharedPref.save('shopping_bag', selectedProducts);
  }

  @override
  Future<void> deleteShoppingBag() async {
    await sharedPref.remove('shopping_bag');
  }

  @override
  Future<List<Product>> getProducts() async {
    final data = await sharedPref.read('shopping_bag');
    if (data == null) {
      return [];
    } else {
      List<Product> selectedProducts = Product.fromJsonList(data).toList();
      return selectedProducts;
    }
  }

  @override
  Future<double> getTotal() async {
    final data = await sharedPref.read('shopping_bag');
    if (data == null) {
      return 0;
    } else {
      double total = 0;
      List<Product> selectedProducts = Product.fromJsonList(data).toList();
      selectedProducts.forEach((product) {
        total = total + (product.price * product.quantity!);
      });
      return total;
    }
  }
}
