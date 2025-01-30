import 'package:eccommerce_riverpord/features/home/presentation/view/product_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: NetworkImage("https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"),)
        ),),
      
        Text(
              'Discover new products',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 5,),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$200',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              
                  Wrap(
                    children: [
                      Icon(Icons.star_rounded, size: 16, color: Colors.amber,),
                  Text("4.0", style: TextStyle(fontSize: 13),)
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