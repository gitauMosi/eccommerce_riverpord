import 'package:flutter/material.dart';

class AppSettingScreen extends StatelessWidget {
  const AppSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Settings"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SettingsSection(
            title: "GENERAL",
            items: [
              SettingsItem(icon: Icons.notifications, title: "Notifications"),
              SettingsItem(icon: Icons.description, title: "Agreements"),
              SettingsItem(
                  icon: Icons.privacy_tip,
                  title: "Releases from confidentiality"),
              SettingsItem(icon: Icons.lock, title: "Password"),
              SettingsItem(icon: Icons.pin, title: "Pin"),
              SettingsItem(icon: Icons.logout, title: "Logout"),
            ],
          ),
          SwitchListTile(
              value: false, title: Text("Dark Mode"), onChanged: (value) {}),
          SettingsSection(
            title: "FEEDBACK",
            items: [
              SettingsItem(icon: Icons.feedback, title: "App feedback"),
              SettingsItem(icon: Icons.bug_report, title: "Bug report"),
            ],
          ),
          SettingsSection(
            title: "LEGAL",
            items: [
              SettingsItem(icon: Icons.privacy_tip_outlined, title: "Privacy"),
              SettingsItem(icon: Icons.gavel, title: "Imprint"),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title;
  final List<SettingsItem> items;

  const SettingsSection({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600]),
        ),
        ...items.map((item) => item),
        SizedBox(height: 16),
      ],
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const SettingsItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueGrey[50],
        child: Icon(icon, color: Theme.of(context).colorScheme.primary),
      ),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Handle navigation or action
      },
    );
  }
}
