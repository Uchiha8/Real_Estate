import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/pages/login/login.dart';
import 'package:real_estate/utils//utils.dart';

class RegScene extends StatefulWidget {
  RegScene();
  @override
  State<StatefulWidget> createState() => RegSceneState();
}

class RegSceneState extends State<RegScene> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          // iphone1313pro2tTv (11:72)
          width: double.infinity,
          height: 820 * fem,
          decoration: BoxDecoration(
            color: Color(0xffccd5f0),
          ),
          child: Stack(
            children: [
              Positioned(
                // rectangle3CHS (13:112)
                right: 182 * fem,
                top: 500 * fem,
                child: Align(
                  child: SizedBox(
                    width: 380 * fem,
                    height: 380 * fem,
                    child: Container(child: Image.asset('images/home.png')),
                  ),
                ),
              ),
              Positioned(
                // signuptoshhbHn (13:84)
                left: 87 * fem,
                top: 98 * fem,
                child: Align(
                  child: SizedBox(
                    width: 215 * fem,
                    height: 42 * fem,
                    child: Text(
                      'Sign up to Viva!',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 30 * ffem,
                        height: 1.2125 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // alreadyhaveanaccountrzQ (13:109)
                left: 187 * fem,
                top: 665 * fem,
                child: Align(
                  child: SizedBox(
                    width: 183 * fem,
                    height: 19 * fem,
                    child: Text(
                      'Already have an account?',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 15 * ffem,
                        height: 1.2125 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // loginYMS (13:110)
                left: 261 * fem,
                top: 687 * fem,
                child: Align(
                  child: SizedBox(
                    width: 39 * fem,
                    height: 19 * fem,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScene()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        'Login',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 15 * ffem,
                          height: 1.2125 * ffem / fem,
                          color: Color(0xff350f9c),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // group31kp (26:169)
                left: 189 * fem,
                top: 599 * fem,
                child: Container(
                  width: 180 * fem,
                  height: 56 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xff350f9c),
                    borderRadius: BorderRadius.circular(50 * fem),
                  ),
                  child: Center(
                    child: Text(
                      'Create Account',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 15 * ffem,
                        height: 1.2125 * ffem / fem,
                        color: Color(0xffccd5f0),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // group9f4g (34:6)
                left: 43 * fem,
                top: 305 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      22 * fem, 12 * fem, 22 * fem, 9 * fem),
                  width: 306 * fem,
                  height: 42 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffd9d9d9)),
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(50 * fem),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(0 * fem, 4 * fem),
                        blurRadius: 2 * fem,
                      ),
                    ],
                  ),
                  child: Text(
                    'Enter your name ',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 15 * ffem,
                      height: 1.2125 * ffem / fem,
                      color: Color(0x7f000000),
                    ),
                  ),
                ),
              ),
              Positioned(
                // group8F2t (34:5)
                left: 43 * fem,
                top: 368 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      25 * fem, 12 * fem, 25 * fem, 9 * fem),
                  width: 306 * fem,
                  height: 42 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffd9d9d9)),
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(50 * fem),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(0 * fem, 4 * fem),
                        blurRadius: 2 * fem,
                      ),
                    ],
                  ),
                  child: Text(
                    'Enter username ',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 15 * ffem,
                      height: 1.2125 * ffem / fem,
                      color: Color(0x7f000000),
                    ),
                  ),
                ),
              ),
              Positioned(
                // group6RrU (34:3)
                left: 43 * fem,
                top: 491 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      22 * fem, 12 * fem, 22 * fem, 9 * fem),
                  width: 306 * fem,
                  height: 42 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffd9d9d9)),
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(50 * fem),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(0 * fem, 4 * fem),
                        blurRadius: 2 * fem,
                      ),
                    ],
                  ),
                  child: Text(
                    'Enter password ',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 15 * ffem,
                      height: 1.2125 * ffem / fem,
                      color: Color(0x7f000000),
                    ),
                  ),
                ),
              ),
              Positioned(
                // group7beU (34:4)
                left: 43 * fem,
                top: 429 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      22 * fem, 12 * fem, 22 * fem, 9 * fem),
                  width: 306 * fem,
                  height: 42 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffd9d9d9)),
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(50 * fem),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(0 * fem, 4 * fem),
                        blurRadius: 2 * fem,
                      ),
                    ],
                  ),
                  child: Text(
                    'Enter  Email',
                    style: SafeGoogleFont(
                      'Inter',
                      fontSize: 15 * ffem,
                      height: 1.2125 * ffem / fem,
                      color: Color(0x7f000000),
                    ),
                  ),
                ),
              ),
              Positioned(
                // group10nix (34:7)
                left: 19 * fem,
                top: 247 * fem,
                child: Container(
                  width: 350 * fem,
                  height: 19 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // line16Dr (13:89)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 11 * fem, 0 * fem),
                        width: 81 * fem,
                        height: 1 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xff350f9c),
                        ),
                      ),
                      Container(
                        // orcontinuewithemail15v (13:92)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 16 * fem, 0 * fem),
                        child: Text(
                          'Or continue with Email',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 15 * ffem,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xff350f9c),
                          ),
                        ),
                      ),
                      Container(
                        // line3uSC (13:148)
                        width: 82 * fem,
                        height: 1 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xff350f9c),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // iagreewiththetermsofserviceand (13:103)
                left: 73 * fem,
                top: 539 * fem,
                child: Align(
                  child: SizedBox(
                    width: 257 * fem,
                    height: 30 * fem,
                    child: Text(
                      'I agree with the Terms of Service and Privacy policy',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 12 * ffem,
                        height: 1.2125 * ffem / fem,
                        color: Color(0xff350f9c),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // rectangle9vs6 (13:104)
                left: 45 * fem,
                top: 543 * fem,
                child: Align(
                  child: SizedBox(
                    width: 20 * fem,
                    height: 20 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff350f9c)),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // group42v8 (26:171)
                left: 43 * fem,
                top: 165 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      62 * fem, 18 * fem, 71 * fem, 18 * fem),
                  width: 306 * fem,
                  height: 56 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xff350f9c),
                    borderRadius: BorderRadius.circular(50 * fem),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // search1W4c (13:105)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 10 * fem, 0 * fem),
                        width: 20 * fem,
                        height: 20 * fem,
                        child: Image.asset(
                          'images/search-1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        // signupwithgooglectL (13:87)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 1 * fem, 0 * fem, 0 * fem),
                        child: Text(
                          'Sign up with Google',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 15 * ffem,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xffccd5f0),
                          ),
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
    );
  }
}
