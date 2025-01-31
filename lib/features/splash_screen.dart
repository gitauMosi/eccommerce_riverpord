import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/providers/product_provider.dart';
import 'main_page.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Trigger state change after the build phase
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/icon.png"),
              SizedBox(
                height: 15,
              ),
              Text(
                "Mobx",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
