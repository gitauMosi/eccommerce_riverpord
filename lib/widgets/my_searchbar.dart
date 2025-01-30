import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MySearchBar extends StatelessWidget {
  String name;
  MySearchBar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          const Icon(Icons.search,),
          const SizedBox(width: 8),
         Expanded(
            child: TextField(
              decoration: InputDecoration(
                fillColor: Theme.of(context).cardColor,
                filled: true,
                hintText: name,
                border: InputBorder.none,
              ),
            ),
          ),
          const Icon(Icons.tune,),
        ],
      ),
    );
  }
}
