// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String name;
  final Function() function;
  const CustomBtn({
    super.key,
    required this.name,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(width * 0.70, 40),
            backgroundColor: Theme.of(context).colorScheme.primary),
        child: Center(
            child: Text(
          name,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        )));
  }
}