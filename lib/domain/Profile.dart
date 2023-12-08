import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String fullName;

  const ProfilePage({Key? key, required this.fullName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fullName),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/edit_profile');
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20.0,
              // Adjust the size of the CircleAvatar
              backgroundColor: Colors.transparent,
              // Use a transparent background
              backgroundImage: AssetImage(
                'lib/images/capybara.png',
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          FunctionalityCard(
            title: 'Past Tours',
            icon: Icons.home,
            onTap: () {
              // Add navigation logic for buying a property
              print('Navigate to Buy a Property');
            },
          ),
          FunctionalityCard(
            title: 'Open House Schedule',
            icon: Icons.account_tree_sharp,
            onTap: () {
              // Add navigation logic for selling a property
              print('Navigate to Sell a Property');
            },
          ),
          FunctionalityCard(
            title: 'Recently Viewed',
            icon: Icons.remove_red_eye,
            onTap: () {
              // Add navigation logic for buying a property
              print('Navigate to Buy a Property');
            },
          ),
          FunctionalityCard(
            title: 'Saved Searches',
            icon: Icons.search,
            onTap: () {
              // Add navigation logic for buying a property
              print('Navigate to Buy a Property');
            },
          ),
          FunctionalityCard(
            title: 'Viva Premier',
            icon: Icons.diamond,
            onTap: () {
              // Add navigation logic for buying a property
              print('Navigate to Buy a Property');
            },
          ),
          FunctionalityCard(
            title: 'Sell Your Home',
            icon: Icons.local_attraction_sharp,
            onTap: () {
              // Add navigation logic for buying a property
              print('Navigate to Buy a Property');
            },
          ),
          FunctionalityCard(
            title: 'List my home for rent',
            icon: Icons.local_attraction_sharp,
            onTap: () {
              // Add navigation logic for buying a property
              print('Navigate to Buy a Property');
            },
          ),
          FunctionalityCard(
            title: 'Careers',
            icon: Icons.local_attraction_sharp,
            onTap: () {
              // Add navigation logic for buying a property
              print('Navigate to Buy a Property');
            },
          ),
          FunctionalityCard(
            title: 'Classes and Events',
            icon: Icons.local_attraction_sharp,
            onTap: () {
              // Add navigation logic for buying a property
              print('Navigate to Buy a Property');
            },
          ),
          FunctionalityCard(
            title: 'Your Agent',
            icon: Icons.local_attraction_sharp,
            onTap: () {
              // Add navigation logic for buying a property
              print('Navigate to Buy a Property');
            },
          ),
          FunctionalityCard(
            title: 'Settings',
            icon: Icons.settings,
            onTap: () {
              // Add navigation logic for buying a property
              print('Navigate to Buy a Property');
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

  FunctionalityCard(
      {required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: double.infinity,
      // Makes the card take the full width of the screen
      margin: EdgeInsets.only(bottom: 15.0),
      child: Card(
        elevation: 2.0,
        child: ListTile(
          leading: Icon(
            icon,
            size: 35.0,
          ),
          title: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 19.0),
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
