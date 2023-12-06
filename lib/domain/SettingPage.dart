import 'package:flutter/material.dart';
import 'profile.dart';

class SettingsPage extends StatefulWidget {
  final String username;
  final String firstName;
  final String lastName;
  final String email;

  const SettingsPage({
    Key? key,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
  }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    _usernameController.text = widget.username;
    _firstNameController.text = widget.firstName;
    _lastNameController.text = widget.lastName;
    _emailController.text = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                String updatedUsername = _usernameController.text;
                String updatedFirstName = _firstNameController.text;
                String updatedLastName = _lastNameController.text;
                String updatedEmail = _emailController.text;

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      username: updatedUsername,
                      firstName: updatedFirstName,
                      lastName: updatedLastName,
                      email: updatedEmail,
                    ),
                  ),
                );
              },
              child: Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
