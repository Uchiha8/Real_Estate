import 'package:flutter/material.dart';
import 'SettingPage.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String firstName;
  final String lastName;
  final String email;

  const ProfilePage({
    Key? key,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('lib/images/capybara.png'),
            ),
            const SizedBox(height: 8),
            Text(
              'FirstName: $firstName',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 8),
            Text(
              'LastName: $lastName',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Username: $username',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(
                      username: username,
                      firstName: firstName,
                      lastName: lastName,
                      email: email,
                    ),
                  ),
                );
              },
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
