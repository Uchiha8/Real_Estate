import 'dart:async';

import 'package:flutter/material.dart';
import 'package:real_estate/pages/login/login.dart';
import 'package:real_estate/pages/home/home_page.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import "package:real_estate/banner_info/CustMaterialBanner.dart";
enum  Role { Customer, Agent }
class RegScene extends StatefulWidget {
  const RegScene();

  @override
  State<StatefulWidget> createState() => RegSceneState();
}

class RegSceneState extends State<RegScene> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String selectedRole = 'Customer';

  bool validatePassword(String password) {
    // Define regular expressions for password criteria
    final RegExp hasUpperCase = RegExp(r'[A-Z]');
    final RegExp hasLowerCase = RegExp(r'[a-z]');
    final RegExp hasDigits = RegExp(r'\d');
    final RegExp hasSpecialCharacters = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    // Check if the password meets all criteria
    bool isPasswordValid = password.length >= 8 &&
        hasUpperCase.hasMatch(password) &&
        hasLowerCase.hasMatch(password) &&
        hasDigits.hasMatch(password) &&
        hasSpecialCharacters.hasMatch(password);

    return isPasswordValid;
  }
  void _register () async{
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
Map<String, dynamic> data = {
  "user": {
    "password": password,
    "last_login": "2024-01-26T13:17:10.394Z",
    "is_superuser": false,
    "role": selectedRole,
    "email": email,
    "first_name": name,
    "last_name": "unknown",
    "is_active": true
  },
  "address": {
    "address_line_1": "unknown1",
    "address_line_2": "unknown",
    "country": "string",
    "state": "string",
    "city": "string",
    "postal_code": "string",
    "longitude": 0,
    "latitude": 0
  }
    };
if(validatePassword(password)){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Text('Loading...'),
          ],
        ),
      );
    },
  );
    final Uri uri = Uri.parse('https://vivahomes.uz/v1/customers/');

    try{ var response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    // Handle the response

    if (response.statusCode == 201) {
      // Successful creation of the user
      showMaterialBanner(context, 'Account successfully created ', _goToLogin,'go to Login');
      print('User created: ${response.body}');
    } else {

        Navigator.of(context).pop();

      // Handle other status codes
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create user. Status code: ${response.statusCode}'),
        ),
      );
      print('Failed to create user. Status code: ${response.statusCode}');
    }
  } catch (e) {

  // Handle exceptions
  print('Error: $e');
  }} else { ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password must contain at least 8 characters, including uppercase, lowercase letters, numbers and special characters'),
        ),
      );}
    // For example, you might want to validate input fields and then
    // proceed with user registration.

    // After successful registration, you can navigate to the home page or perform other actions.

  }

  void _goToLogin() {
    ScaffoldMessenger.of(context).clearMaterialBanners();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScene()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffccd5f0),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60,),
                Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1d5482),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40,),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                        ),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                        ),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,

                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                        ),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
            Text(
              'Role:',
              style: TextStyle(
                color: Color(0xff350f9c),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Radio(
                  activeColor: Color(0xff350f9c),
                  splashRadius: 30,
                  value: 'Customer',
                  groupValue: selectedRole,
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value.toString();
                    });
                  },
                ),
                const Text('Customer', style: TextStyle(color: Color(0xff350f9c)),),
                Radio(
                  activeColor: const Color(0xff350f9c),
materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  splashRadius: 30,
                  value: 'Agent',
                  groupValue: selectedRole,
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value.toString();
                    });
                  },
                ),
                Text('Agent', style: TextStyle(color: Color(0xff350f9c)),),
              ],
            ),
              SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Color(0xff350f9c),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: _goToLogin,
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(fontSize: 17),
                  ),
                ),


          ]),
        ),
      ),
    ));
  }
}
