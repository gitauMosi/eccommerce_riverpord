import 'package:eccommerce_riverpord/features/cart/models/cart_model.dart';
import 'package:eccommerce_riverpord/features/cart/providers/cart_providers.dart';
import 'package:eccommerce_riverpord/features/home/models/product_model.dart';
import 'package:eccommerce_riverpord/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductScreen extends StatelessWidget {
  Product product;
   ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 320,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    image: DecorationImage(
                      image: NetworkImage(
                        product.image,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  child: _customAppBar(context),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            _detailsSection()
          ],
        ),
      ),
      bottomSheet: _customBottomSheet(context),
    );
  }

  Widget _detailsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            "\$${product.price}",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Reviews
              Wrap(
                spacing: 4.0,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20.0,
                  ),
                  Text(
                    "(${product.rating.count}) Reviews",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              Text(
                "Seller: Unknown",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            "Description:",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            product.description,
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _customBottomSheet(BuildContext context) {
    final cartProvider = Provider.of<CartProviders>(context);
    return SizedBox(
      height: 70,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Theme.of(context).colorScheme.onSurface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surface,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.remove,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  Text(
                    "1",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                cartProvider.addItem(
                  CartItem(product: product, price: product.price)
                );
                showSnackBarWidget(context, "Product Added to Cart Successfull");

              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.50,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.secondary),
                child: Center(
                    child: Text(
                  "Add to Cart",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _customAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor,
                ),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 20,
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor,
                  ),
                  child: Icon(
                    Icons.share_rounded,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor,
                  ),
                  child: Icon(
                    Icons.favorite_outline_rounded,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
