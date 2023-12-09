import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widgets/icon_text.dart';
import 'package:real_estate/pages/search/search_page.dart';
import 'widgets/property_card.dart';
import 'package:real_estate/models/property_model.dart';
import 'widgets/section_heading.dart';
import 'package:real_estate/pages/property_details/property_details.dart';
import 'package:real_estate/pages/favorites/favorites_page.dart';
import 'package:real_estate/pages/profile/profile.dart';
import 'package:real_estate/pages/notifications/app_notifications_page.dart';

class HomePage extends StatefulWidget {
  final String? initialUsername;

  HomePage({this.initialUsername});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _username;
  late double screenHeight;
  late String currentDate;
  late TextEditingController searchController;
  late bool isLoading;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _username = widget.initialUsername ?? 'User';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenHeight = MediaQuery.of(context).size.height;
    currentDate = DateFormat('MMMMEEEEd').format(DateTime.now());
  }

  void updateUsername(String newUsername) {
    setState(() {
      _username = newUsername;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final now = DateTime.now();
    String currentDate = DateFormat('MMMMEEEEd').format(now);
    final TextEditingController searchController = TextEditingController();
    bool isLoading = false;

    List<Property> featuredProperties = [
      Property(
        title: 'Beautiful Villa',
        description: '4 beds, 3 baths',
        baths: 3,
        rooms: 4,
        price: 100000000,
        coverPhoto:
            'https://i.pinimg.com/736x/0b/c1/c4/0bc1c4bafc0e48432178ca351929e4a1.jpg',
      ),
      Property(
        title: 'Beautiful Villa',
        description: '2 beds, 3 baths',
        baths: 3,
        rooms: 2,
        price: 100000000,
        coverPhoto:
            'https://mir-s3-cdn-cf.behance.net/project_modules/1400/70983074973155.5c3f7fc151921.jpg',
      ),
    ];

    List<Property> trendingProperties = [
      Property(
        title: 'Luxury Apartment',
        description: '2 beds, 2 baths',
        baths: 2,
        rooms: 2,
        price: 100000000,
        coverPhoto:
            'https://www.conradvillas.com/uploads/properties/103/ultra-luxury-bespoke-villas-in-bangkok-46297703.jpeg',
      ),
      Property(
        title: 'Luxury Apartment',
        description: ' 3 beds, 2 baths',
        baths: 2,
        rooms: 3,
        price: 100000000,
        coverPhoto:
            'https://www.conradvillas.com/uploads/properties/103/ultra-luxury-bespoke-villas-in-bangkok-47475608.jpeg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('images/logo.png'),
            ),
            SizedBox(width: 25),
            Text(
              'VIVA HOMES',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xff368aea),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xc4dbd5d5),
                padding: EdgeInsets.only(
                  left: 22,
                  right: 22,
                  top: 25,
                  bottom: 25,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentDate,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Welcome," + _username + " 👋",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                              color: Colors.green.withOpacity(0.1),
                            ),
                          ),
                          width: 30,
                          height: 30,
                          child: Icon(
                            Icons.notification_important_outlined,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(3),
                      height: 57,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: searchController,
                              onChanged: null,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue.withOpacity(0.8),
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: "Location",
                                prefixIcon: Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.blue.withOpacity(0.4),
                                  size: 20,
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue.withOpacity(0.4),
                                  fontWeight: FontWeight.normal,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconText(
                            color: Colors.grey,
                            icon: Icons.bed_outlined,
                            text: "Bed",
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.withOpacity(0.5),
                              fontWeight: FontWeight.w600,
                            ),
                            size: 21,
                          ),
                          IconText(
                            color: Colors.grey,
                            icon: Icons.currency_exchange,
                            text: "500-1000",
                            textStyle: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.withOpacity(0.5),
                              fontWeight: FontWeight.w600,
                            ),
                            size: 17,
                          ),
                          IconText(
                            color: Colors.grey,
                            icon: Icons.house_outlined,
                            text: "Type",
                            textStyle: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.withOpacity(0.5),
                              fontWeight: FontWeight.w600,
                            ),
                            size: 21,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        if (searchController.text.isNotEmpty) {
                          String searchText = searchController.text;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SearchPage(searchText: searchText),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Please enter a search query')),
                          );
                        }
                      },
                      child: Container(
                        width: 330,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Search",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SectionHeading(
                text: "Featured",
                onTap: () {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.blue)
                    : Container(
                        width: double.infinity,
                        height: 300.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (ctx, index) {
                            return PropertyCard(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PropertyDetailsPage(
                                      property: featuredProperties[index],
                                    ),
                                  ),
                                );
                              },
                              property: featuredProperties[index],
                            );
                          },
                        ),
                      ),
              ),
              SectionHeading(text: "Trending", onTap: () {}),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.blue)
                    : Container(
                        width: double.infinity,
                        height: 300.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (ctx, index) {
                            return PropertyCard(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PropertyDetailsPage(
                                      property: trendingProperties[index],
                                    ),
                                  ),
                                );
                              },
                              property: trendingProperties[index],
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        backgroundColor: Colors.black,
        iconSize: 20,
        unselectedItemColor: Colors.grey.withOpacity(0.7),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(
                          initialUsername: _username,
                        )),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppNotificationsPage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(
                          fullName: _username,
                        )),
              );
              break;
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
