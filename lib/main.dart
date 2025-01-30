import 'package:eccommerce_riverpord/core/utils/theme.dart';
import 'package:eccommerce_riverpord/features/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
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
