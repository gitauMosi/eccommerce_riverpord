import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                image: NetworkImage(
                    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Smart Bag",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              Text("Clothing"),
              Text(
                "\$70.00",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ],
          ),
         Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.red,
                  )),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
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
                        size: 18,
                      ),
                    ),
                    Text(
                      "1",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.add,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
