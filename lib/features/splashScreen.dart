
import 'package:flutter/material.dart';

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
    Future.delayed(Duration(seconds: 3), (){
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(child: Text("Mobx", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),),
      ),
    );
  }
}