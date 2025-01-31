


import 'package:flutter/material.dart';

import '../models/cart_model.dart';

class CartProviders with ChangeNotifier {

  List<CartItem> cartItems = [];

  void addItem(CartItem item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }

  void updateItemQuantity(int index, int quantity) {
    if (quantity > 0) {
      cartItems[index].quantity = quantity;
      notifyListeners();
    }
  }

  void updateItemPrice(int index, double price) {
    if (price > 0) {
      cartItems[index].price = price;
      notifyListeners();
    }
  }

  double getTotalPrice() {
    return cartItems.fold(0, (total, item) => total + item.price * item.quantity);
  }


}