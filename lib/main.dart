import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/firebase_options.dart';
import 'package:real_estate/utils/utils.dart';
import 'package:real_estate/pages/scene/scene.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:real_estate/pages/home/home_page.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());}

class LogoAnimation extends StatefulWidget {
  @override
  _LogoAnimationState createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();

    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        int? userId = prefs.getInt('user_id');
        String? token = prefs.getString('token');

        if (userId != null && token != null) {
          // Navigate to bottombar with required parameters
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => bottombar(
                userId: userId, // Replace with your logic to get the actual user ID
                token: token, // Replace with your logic to get the actual user token
              ),
            ),
          );
        } else {
        // Navigate to login screen after animation completes
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => Scene(), // Your login screen widget
          ),
        );
      }
    }});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffccd5f0), // Set your desired background color
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            // Your logo widget/image goes here
            width: 500, // Adjust size as needed
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/logo2.png'), // Replace with your logo
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.reverseDuration;
    super.dispose();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viva Homes',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LogoAnimation(),
      ),
    );
  }
}
