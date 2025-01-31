import 'package:flutter/material.dart';

void showSnackBarWidget(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            Icon(
              Icons.verified,
              color: Colors.white,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              message, // Use the message parameter
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      duration: Duration(seconds: 2),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),

      backgroundColor: const Color.fromARGB(255, 1, 117, 106), // Modern color
      elevation: 6, // Subtle shadow
      behavior: SnackBarBehavior.floating, // Floating effect
    ),
  );
}
