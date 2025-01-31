import 'package:eccommerce_riverpord/features/home/providers/product_provider.dart';
import 'package:eccommerce_riverpord/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/models/product_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My Cart",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Consumer<ProductProvider>(
            builder: (context, productProvider, child) {
          if (productProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (productProvider.error.isNotEmpty) {
            return Center(child: Text(productProvider.error));
          } else {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6.0,
                  crossAxisSpacing: 6.0,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  Product product = productProvider.products[index];
                  return ProductCard(
                    product: product,
                  );
                });
          }
        }));
  }
}
