import 'package:eccommerce_riverpord/features/cart/models/cart_model.dart';
import 'package:eccommerce_riverpord/features/cart/providers/cart_providers.dart';
import 'package:eccommerce_riverpord/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final cartProvider = Provider.of<CartProviders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Consumer<CartProviders>(
                builder: (context, cartProvider, child){
                  return ListView.builder(
                  itemCount: cartProvider.cartItems.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    CartItem item = cartProvider.cartItems[index];
                    return CartCard(item: item, index: index,);
                  });
                },
              ),
              SizedBox(
                height: 250,
              )
            ],
          ),
        ),
      ),
      bottomSheet: _customBottmSheet(context),
    );
  }

  Container _customBottmSheet(BuildContext context) {
    final cartProvider = Provider.of<CartProviders>(context);
    return Container(
      height: 250,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Code",
              label: Text('Enter Discount code'),
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Apply",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtitle",
              ),
              Text(
                "\$${cartProvider.getTotalPrice()}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              Text(
                "\$${cartProvider.getTotalPrice()}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {},
            child: Material(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(26)),
                child: Center(
                    child: Text(
                  "Checkout",
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onPrimary),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
