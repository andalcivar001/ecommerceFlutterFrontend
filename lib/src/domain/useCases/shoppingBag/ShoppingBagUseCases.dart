import 'package:ecommerce_flutter/src/domain/useCases/shoppingBag/AddShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/shoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/shoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/shoppingBag/GetProductsShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/shoppingBag/GetTotalShoppingBagUseCase.dart';

class ShoppingBagUseCases {
  AddShoppingBagUseCase add;
  GetProductsShoppingBagUseCase getProducts;
  DeleteShoppingBagUseCase deleteShoppingBag;
  DeleteItemShoppingBagUseCase deleteItem;
  GetTotalShoppingBagUseCase getTotal;

  ShoppingBagUseCases({
    required this.add,
    required this.getProducts,
    required this.deleteItem,
    required this.deleteShoppingBag,
    required this.getTotal,
  });
}
