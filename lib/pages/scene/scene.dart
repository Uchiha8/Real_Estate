import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate/utils/utils.dart';
import 'package:real_estate/pages/login/login.dart';

class Scene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SceneState();
}

class SceneState extends State<Scene> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // iphone1313pro1SLk (1:8)
        width: double.infinity,
        height: 820 * fem,
        decoration: BoxDecoration(
          color: Color(0xffccd5f0),
        ),
        child: Stack(
          children: [
            Positioned(
              // rectangle3CHS (13:112)
              left: 6 * fem,
              top: 60 * fem,
              child: Align(
                child: SizedBox(
                  width: 380 * fem,
                  height: 380 * fem,
                  child: Container(child: Image.asset('images/logo2.png')),
                ),
              ),
            ),
            Positioned(
              // signupyB2 (13:161)
              left: 90 * fem,
              top: 600 * fem,
              child: Align(
                child: SizedBox(
                  width: 216 * fem,
                  height: 60 * fem,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScene()));
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          67 * fem, 18 * fem, 50 * fem, 18 * fem),
                      width: 306 * fem,
                      height: 60 * fem,
                      decoration: BoxDecoration(
                        color: Color(0xff350f9c),
                        borderRadius: BorderRadius.circular(50 * fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // loginwithgoogleZLG (13:117)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 1 * fem, 0 * fem, 0 * fem),
                            child: Text(
                              'Continue',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 20 * ffem,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
