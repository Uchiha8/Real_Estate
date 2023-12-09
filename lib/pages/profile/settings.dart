import 'package:flutter/material.dart';
import 'package:real_estate/pages/profile/Profile.dart';
import 'package:real_estate/pages/notifications/app_notifications_page.dart';
import 'package:real_estate/pages/notifications/email_notification.dart';
import 'package:real_estate/pages/notifications/text_notification.dart';

class SettingsPage extends StatelessWidget {
  final String title;

  const SettingsPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
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
