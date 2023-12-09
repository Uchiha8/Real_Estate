import 'package:flutter/material.dart';
import 'package:real_estate/profile/Profile.dart';
import 'notifications/AppNotificationsPage.dart';
import 'notifications/EmailNotification.dart';
import 'notifications/TextNotification.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          FunctionalityCard(
            title: 'App Notifications',
            icon: Icons.notifications,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppNotificationsPage()));
            },
          ),
          FunctionalityCard(
            title: 'Email Notification',
            icon: Icons.account_tree_sharp,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EmailNotificationPage()));
            },
          ),
          FunctionalityCard(
            title: 'Text Notification',
            icon: Icons.remove_red_eye,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TextNotificationPage()));
            },
          ),
        ],
      ),
    );
  }
}
