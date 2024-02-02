import 'package:flutter/material.dart';
import 'package:real_estate/pages/favorites/favorites_page.dart';
import 'package:real_estate/pages/home/home_page.dart';
import 'package:real_estate/pages/notifications/app_notifications_page.dart';
import 'package:real_estate/pages/profile/past_tours.dart';
import 'package:real_estate/pages/profile/update_profile_page.dart';
import 'open_house.dart';
import 'settings.dart';
import 'package:real_estate/models/user_model.dart';
class ProfilePage extends StatelessWidget {
  final CustomUser? user;

  const ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
// CircleAvatar(
// radius: 20,
// backgroundImage: AssetImage('images/capybara.png'),
// ),
            SizedBox(width: 25),
            Text(
              'Viva Profile',
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
      backgroundColor: const Color(0x77ccd5f0),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
// Align(
// alignment: Alignment.topCenter,
// child: CircleAvatar(
// radius: 60,
// backgroundImage: AssetImage('images/capybara.png'),
// ),
// ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topCenter,
            child: Container(

              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xffccd5f0),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.transparent,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/capybara.png'),
                  ),
                  SizedBox(height: 10),
// Adding sample data fields in a stylized container
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      "Full Name: John Coe",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xcc350f9c),
                        fontWeight: FontWeight.w500,
                      ), overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      "Location: Sergeli, Tashkent,",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xcc350f9c),
                        fontWeight: FontWeight.w500,
                      ), overflow: TextOverflow.clip,
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Text(
                      "Contact: +998 90 977 34 55",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xcc350f9c),
                        fontWeight: FontWeight.w500,
                      ), overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          FunctionalityCard(
            title: 'Update Profile',
            icon: Icons.home,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UpdateProfilePage()));
            },
          ),
          FunctionalityCard(
            title: 'Settings',
            icon: Icons.home,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PastToursPage()));
            },
          ),
          FunctionalityCard(
            title: 'Past Tours',
            icon: Icons.home,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PastToursPage()));
            },
          ),
        ],
      ),
    );
  }
}

class FunctionalityCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

   const FunctionalityCard(
      {super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 80.0,
      width: double.infinity,
// Makes the card take the full width of the screen
      margin: const EdgeInsets.only(bottom: 0.0),
      child: Card(
        semanticContainer: false,
        borderOnForeground: true,
        elevation: 0.0,
        child: ListTile(
          leading: Icon(
            icon,
            size: 35.0,
            color: const Color(0xff350f9c),
          ),
          title: Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 19.0),
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}