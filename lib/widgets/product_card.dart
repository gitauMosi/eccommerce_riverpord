import 'package:eccommerce_riverpord/features/home/models/product_model.dart';
import 'package:eccommerce_riverpord/features/home/presentation/product_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  Product product;
   ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductScreen(product: product,)));
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            product.image),
                      ),
                      ),
                ),

                Positioned(
                  right: 5,
                  top: 3,
                  child: Icon(Icons.favorite_outline_outlined, size: 16,))
              ],
            ),
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Wrap(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 16,
                        color: Colors.amber,
                      ),
                      Text(
                        product.rating.rate.toString(),
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
