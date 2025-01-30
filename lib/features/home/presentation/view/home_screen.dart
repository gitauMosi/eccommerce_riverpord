import 'package:eccommerce_riverpord/features/home/data/models/cartegory_model.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/my_searchbar.dart';
import '../../../../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _customAppBar(context)),
              SliverToBoxAdapter(child: MySearchBar(name: 'Search stocks')),
              SliverToBoxAdapter(child: _promoCard(context)),
              SliverToBoxAdapter(child: _categorySection()),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ProductCard();
                  },
                  childCount: 10,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _categorySection() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          itemCount: categoriesList.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            CartegoryModel category = categoriesList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(category.imgUrl),
                  ),
                  Text(category.name)
                ],
              ),
            );
          }),
    );
  }

  Container _promoCard(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Super Sale\nDiscount",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Up to',
                    style: Theme.of(context).textTheme.titleSmall),
                TextSpan(
                    text: '\n50%',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold)),
              ])),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.secondary),
                child: Center(
                    child: Text(
                  "Shop Now",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.bold),
                )),
              )
            ],
          ),
          Image.asset(
            "assets/images/promo2.png",
          )
        ],
      ),
    );
  }

  Padding _customAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Theme.of(context).cardColor),
            child: Icon(Icons.grid_view_sharp),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Theme.of(context).cardColor),
            child: Icon(Icons.notifications_none),
          )
        ],
      ),
    );
  }
}
