import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/cart/models/cart_model.dart';
import '../features/cart/providers/cart_providers.dart';

// ignore: must_be_immutable
class CartCard extends StatelessWidget {
  CartItem item;
  int index;

  CartCard({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProviders>(context);
    
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 3.0),
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.surface,
              image: DecorationImage(
                image: NetworkImage(item.product.image),
              ),
            ),
          ),
          SizedBox(width: 5),
          Expanded( // This will allow the text to take available space
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.title,
                  maxLines: 2, // Limit title to 2 lines
                  overflow: TextOverflow.ellipsis, // Prevent overflow
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                Text("Clothing"), // Replace with actual category if needed
                Text(
                  "\$${item.product.price}", // Dynamically show the price
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                 cartProvider.removeItem(index);
                },
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.red,
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle quantity decrease
                        cartProvider.updateItemQuantity(index, item.quantity-1);
                      },
                      child: Icon(
                        Icons.remove,
                        size: 18,
                      ),
                    ),
                    Text(
                      "${item.quantity}", // Dynamically show item quantity
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle quantity increase
                        cartProvider.updateItemQuantity(index, item.quantity+1);
                      },
                      child: Icon(
                        Icons.add,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
