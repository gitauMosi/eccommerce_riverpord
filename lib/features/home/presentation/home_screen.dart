
import 'package:flutter/material.dart';

import '../../../widgets/product_card.dart';
import '../../notification/views/notifacation_screen.dart';
import '../models/cartegory_model.dart';
import 'search_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> allItems = [
    "Apple",
    "Banana",
    "Cherry",
    "Grapes",
    "Orange",
    "Mango",
    "Pineapple",
    "Peach",
    "Strawberry",
    "Watermelon"
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    // Initially, show all items.
    filteredItems = allItems;
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = allItems;
      } else {
        filteredItems = allItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _customAppBar(context)),
              SliverToBoxAdapter(child: _searchBarWidget(context)),
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

  Container _searchBarWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              onChanged: _filterItems,
              decoration: InputDecoration(
                fillColor: Theme.of(context).cardColor,
                filled: true,
                hintText: "Search..",
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(allItems),
                );
              },
              child: const Icon(
                Icons.search,
              )),
        ],
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
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotifacationScreen(),
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Theme.of(context).cardColor),
              child: Icon(Icons.notifications_none),
            ),
          )
        ],
      ),
    );
  }
}
