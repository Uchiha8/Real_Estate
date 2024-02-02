import 'package:flutter/material.dart';

class UpdateProfilePage extends StatefulWidget {
  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
// You can add necessary fields and methods for updating the profile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 25),
            Text(
              'Update Profile',
              style: TextStyle(
                color: Color(0xff350f9c),
                fontFamily: 'Poppins',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xffccd5f0),
        elevation: 3,
      ),
      body: Center(
        child: Text(
          'This is the Update Profile Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
// Add your form or widgets for updating the profile here
    );
  }
}