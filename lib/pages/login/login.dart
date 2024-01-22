import 'package:flutter/material.dart';
import 'package:real_estate/pages/home/home_page.dart';
import 'package:real_estate/pages/signup/registration.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:real_estate/pages/login/forgot_password.dart';
class LoginScene extends StatefulWidget {
  const LoginScene();
  @override
  State<StatefulWidget> createState() => LoginSceneState();
}

class LoginSceneState extends State<LoginScene> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      // TODO: handle signed-in user (googleUser) here

    } catch (error) {
    // TODO: handle sign-in errors here
    print('Error signing in with Google: $error');
    }
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    // Check username and password here
    if (username.isNotEmpty && password.isNotEmpty) {
      // Navigate to the homepage with the username and password
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => bottombar(
            initialUsername: username,
          ),
        ),
      );
    } else {
      // Show an error/snackbar for empty fields
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter username and password'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _goToSignUp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RegScene()),
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
                  'Login to ViVa Homes!',
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
                    children: [ SizedBox(height:40,),
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: 'Username',
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
                      SizedBox(height: 40),

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
                      Row(children: [ SizedBox(width: 179,),TextButton(
                        onPressed: () {
                          // TODO: Implement forgot password functionality
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => ForgotPasswordScene()),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff350f9c),
                          ),
                        ),
                      ),],),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    padding:
                    EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Color(0xff350f9c),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(height: 20),
                TextButton(onPressed:_goToSignUp ,
                  child: Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                SizedBox(height: 10),
                // ElevatedButton(
                //   onPressed: _goToSignUp,
                //   style: ElevatedButton.styleFrom(
                //     padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30),
                //     ),
                //     backgroundColor: Color(0xff350f9c),
                //   ),
                //   child: Text(
                //     'Signup',
                //     style: TextStyle(
                //       fontSize: 17,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                SizedBox(height: 50),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _handleGoogleSignIn();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            primary: Color(
                                0xff350f9c), // Replace with your preferred color
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'images/search-1.png', // Replace with Google logo path
                                height: 24, // Adjust height as needed
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Continue with Google',
                                style: TextStyle(fontSize: 20, color: Color(0xffffffff)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20), // Adjust spacing between buttons
                        TextButton(
                          onPressed: () {
                            // Implement Email Sign-In functionality
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                  color:
                                  Colors.grey), // Add border for visibility
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'images/email.png',
                                height: 24, // Adjust height as needed
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Continue with Email',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
