import 'package:eccommerce_riverpord/features/auth/presentation/view/login_screen.dart';
import 'package:eccommerce_riverpord/features/profile/presentation/view/app_setting_screen.dart';
import 'package:eccommerce_riverpord/features/profile/presentation/view/edit_profile_screen.dart';
import 'package:eccommerce_riverpord/features/profile/presentation/view/payment_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen()));
              },
              icon: const Icon(Icons.edit_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-600nw-1714666150.jpg"),
              ),
              const Text(
                "John doe",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Text("@doe"),
              const Text("info@gmail.com"),
              const SizedBox(
                height: 20,
              ),
              customListTile(
                  context, "Track Order", Icons.delivery_dining, () {}),
              customListTile(
                  context, "Payment", Icons.account_balance_wallet_outlined,
                  () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
              }),
              customListTile(context, "Refer A Friend", Icons.people, () {}),
              customListTile(context, "Promotions", Icons.local_offer, () {}),
              customListTile(context, "Settings", Icons.settings, () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>AppSettingScreen()));
              }),
              customListTile(context, "Log Out", Icons.logout, () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              }),
            ],
          ),
        ),
      ),
    );
  }

  ListTile customListTile(
      BuildContext context, String name, IconData icon, Function() function) {
    return ListTile(
      leading: CircleAvatar(
         backgroundColor: Colors.blueGrey[50],
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      title: Text(name),
      onTap: function,
    );
  }
}

