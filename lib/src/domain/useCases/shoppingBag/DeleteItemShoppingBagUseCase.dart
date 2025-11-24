import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/repository/ShoppingBagRepository.dart';

class DeleteItemShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  DeleteItemShoppingBagUseCase(this.shoppingBagRepository);

  run(Product product) => shoppingBagRepository.deleteItem(product);
}
