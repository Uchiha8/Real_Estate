import 'dart:async';
import '';
import 'package:flutter/material.dart';
import 'package:real_estate/pages/home/home_page.dart';
import 'package:real_estate/pages/signup/registration.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:real_estate/pages/login/forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:real_estate/banner_info/CustMaterialBanner.dart';
class LoginScene extends StatefulWidget {
  const LoginScene();
  @override
  State<StatefulWidget> createState() => LoginSceneState();
}

class LoginSceneState extends State<LoginScene> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

 Future<User?> _handleGoogleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        // Get GoogleSignInAuthentication object
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        // Create GoogleSignInCredentials object
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // Sign in to Firebase with Google credentials
        UserCredential authResult =
        await _auth.signInWithCredential(credential);

        // Get the current user
        User? user = authResult.user;

        return user;}
   //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=> bottombar(initialUsername: _googleSignIn.currentUser?.displayName,)), (route) => false);
    } catch (error) {
    // TODO: handle sign-in errors here
    print('Error signing in with Google: $error');
    return null;
      }

  }

  void _login() {

   String? token;
    String email = _emailController.text;
    String password = _passwordController.text;
    final Uri uri = Uri.parse('https://vivahomes.uz/v1/token/');
    Map<String, dynamic> data = {
      "email": email,
      "password": password,
    };
    if(email.isEmpty || password.isEmpty){
      showMaterialBanner(context, 'Please, fill all of the fields', (){ScaffoldMessenger.of(context).clearMaterialBanners();}, 'x');
    } else {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return const AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16),
                Text('Logging in...'),
              ],
            ),
          );
        },
      );
    http.post(uri, body: jsonEncode(data), headers: {'Content-Type': 'application/json'}).then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        token = jsonResponse['access'];
        http.get(Uri.parse('https://vivahomes.uz/v1/user/'), headers: {'Authorization': 'Bearer $token'})
            .then((getUserResponse) {
          if (getUserResponse.statusCode == 200) {
            Map<String,dynamic> data = jsonDecode(getUserResponse.body);
            print(getUserResponse);
            int userId = data['user_id'];
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => bottombar(userId: userId, token: token)),
                  (route) => false,
            );
          } else {
            // Handle error for the second HTTP request
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Request failed with status: ${getUserResponse.statusCode}.'),
              ),
            );
            print('Request failed with status: ${getUserResponse.statusCode}.');
          }
        });
        print("token received:$token");
      } else {
        Navigator.of(context).pop();
        if(response.statusCode == 400){
          showMaterialBanner(context, 'Wrong email or password', (){ScaffoldMessenger.of(context).clearMaterialBanners();}, 'x');
}
      }
    });




 }}


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

                const SizedBox(height: 60,),
                const Text(
                  'Login to Viva Homes!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color:  Color(0xff350f9c),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ const SizedBox(height:40,),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Color(0x88350f9c)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                        ),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 40),

                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Color(0x88350f9c)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                        ),
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(children: [ const SizedBox(width: 179,),TextButton(
                        onPressed: () {
                          // TODO: Implement forgot password functionality
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => ForgotPasswordScene()),
                          );
                        },
                        child: const Text(
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
               const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color(0xff350f9c),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                const SizedBox(height: 20),
                TextButton(onPressed:_goToSignUp ,
                  child: const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Container(width: 150,height: 2,color: Color(0xff350f9c),),
                    const Text(
                      'Or',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff350f9c),
                      ),
                    ),
                    Container(width: 150,height: 2,color: Color(0xff350f9c),)
                  ],
                ),
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          User? user= null;
                           user = await _handleGoogleSignIn();
                          if (user != null) {

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => bottombar(
                                  userId: 2,
                                  token: user?.uid,

                                ),
                              ), (route) => false,
                            );
                           print('User signed in: ${user.displayName}');
                          } else {
                           print('Sign in failed');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding:const  EdgeInsets.symmetric(
                              horizontal: 20, vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Color(
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

                    ],
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
