import 'package:flutter/widgets.dart';
import 'package:shoppu/models/product.dart';

class Cart extends ChangeNotifier {
  List<Product> cartItems = [];
  double totalPrice = 0.0;

  List<Product> getCartItems() => cartItems;

  int getCartLen() => cartItems.length;

  double getTotalPrice() => totalPrice;

  add(Product product) {
    cartItems.add(product);
    totalPrice += product.price;    
    notifyListeners();
  }

  remove(Product product) {
    cartItems.remove(product);
    totalPrice -= product.price;
    notifyListeners();
  }
}
