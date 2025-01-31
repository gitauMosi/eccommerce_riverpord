import 'package:flutter/material.dart';

class NotificationViewScreen extends StatelessWidget {
  const NotificationViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Theme.of(context).cardColor
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                  const Text(
              "You have a new notification",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text("Notification content"),
            const SizedBox(height: 10),
            const Text("Notification timestamp: 2023-07-10 12:34:56"),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
              children: const [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Text("Mark as read"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.delete, color: Colors.red),
                SizedBox(width: 8),
                Text("Delete"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.reply, color: Colors.blue),
                SizedBox(width: 8),
                Text("Reply"),
              ],
            ),
              ],
            ),
            const SizedBox(height: 20),
              ],
            ),
          )
          ],
        ),
      ),
    );
  }
}
