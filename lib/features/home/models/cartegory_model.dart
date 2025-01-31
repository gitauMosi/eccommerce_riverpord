

class CartegoryModel {
  String name;
  String imgUrl;

  CartegoryModel({required this.name, required this.imgUrl});
}


final List<CartegoryModel> categoriesList = [
     CartegoryModel(name: "electronics", imgUrl: "assets/icons/electronics.png"),
     CartegoryModel(name: "jewelery", imgUrl: "assets/icons/jewelery.png"),
     CartegoryModel(name: "men's clothing", imgUrl: "assets/icons/men.png"),
     CartegoryModel(name: "women's clothing", imgUrl: "assets/icons/women.png"),
];