
import 'package:eccommerce_riverpord/core/network.dart';
import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  final ApiServices _apiServices;

  ProductProvider(this._apiServices);
  List<Product> _products = [];
  bool _isLoading = false;
  String _error = '';

  List<Product>  get products => _products;
  bool get isLoading => _isLoading;
  String get error => _error;


  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiServices.get("/products");
      _products = productFromJson(response!.data);
      _error = '';
      notifyListeners();
    } catch (error) {
      _error = error.toString();
      print("Error: " + error.toString());
      throw Exception("Failed to fetch products");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


}