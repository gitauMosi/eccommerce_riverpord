


import '../../home/models/product_model.dart';

class CartItem {
  Product product;
  double price;
  int quantity;
  CartItem({required this.product, required this.price, this.quantity = 1});
}