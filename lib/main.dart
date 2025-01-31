import 'package:eccommerce_riverpord/core/utils/theme.dart';
import 'package:eccommerce_riverpord/features/cart/providers/cart_providers.dart';
import 'package:eccommerce_riverpord/features/home/providers/product_provider.dart';
import 'package:eccommerce_riverpord/features/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'core/network.dart';

void main() {
  
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
  ));

  final ApiServices apiServices = ApiServices();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider(apiServices)),
        ChangeNotifierProvider(create: (context) => CartProviders())
      ],
      child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobx',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light.copyWith(textTheme: GoogleFonts.quicksandTextTheme()),
      //darkTheme: AppTheme.dark,
      home:  Splashscreen(),
    );
  }
}
