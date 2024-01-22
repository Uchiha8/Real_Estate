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
        description: 'Dream home for sale',
        baths: 3,
        rooms: 4,
        price: 100000000,
        coverPhoto:
        'https://i.pinimg.com/736x/0b/c1/c4/0bc1c4bafc0e48432178ca351929e4a1.jpg',
      ),
      Property(
        title: 'Beautiful Villa',
        description: 'Unbelievable price',
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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('images/logo.png'),
            ),
            SizedBox(width: 25),
            Text(
              'Viva Homes',
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
        elevation: 30,
      ),
      body: Container(
        color: const Color(0x77ccd5f0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color(0xaaccd5f0),
                padding: const EdgeInsets.only(
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
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xff350f9c),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Welcome, " + _username + " 👋",
                              style: TextStyle(
                                fontSize: 24,
                                color: Color(0xcc350f9c),
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
                            color: Color(0xff350f9c),
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
                          Radius.circular(30),
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
                                color: Color(0xff350f9c).withOpacity(0.8),
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: "Location",
                                prefixIcon: Icon(
                                  Icons.location_on_outlined,
                                  color: Color(0xff350f9c).withOpacity(0.4),
                                  size: 20,
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff350f9c).withOpacity(0.4),
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
                            color: Color(0xff350f9c),
                            icon: Icons.bed_outlined,
                            text: "Bed",
                            textStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0xff350f9c).withOpacity(0.5),
                              fontWeight: FontWeight.w600,
                            ),
                            size: 21,
                          ),
                          IconText(
                            color: Color(0xff350f9c),
                            icon: Icons.currency_exchange,
                            text: "500-1000",
                            textStyle: TextStyle(
                              fontSize: 13,
                              color: Color(0xff350f9c).withOpacity(0.5),
                              fontWeight: FontWeight.w600,
                            ),
                            size: 17,
                          ),
                          IconText(
                            color: Color(0xff350f9c),
                            icon: Icons.house_outlined,
                            text: "Type",
                            textStyle: TextStyle(
                              fontSize: 13,
                              color: Color(0xff350f9c).withOpacity(0.5),
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
                        width: 320,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color(0xff350f9c),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Search",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SectionHeading(

                text: "Featured" ,

                onTap: () {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
                child: isLoading
                    ?  CircularProgressIndicator(color: Colors.blue)
                    : Container(
                  width: double.infinity,
                  height: 350.0,
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
                        property: featuredProperties[index],                            );
                    },
                  ),
                ),
              ),
              SectionHeading(text: "Trending", onTap: () {}),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.blue)
                    : Container(
                  width: double.infinity,
                  height: 350.0,
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
    );
  }
}

class bottombar extends StatefulWidget {
  final String? initialUsername;
  const bottombar({this.initialUsername});



  @override
  State<bottombar> createState() => _bottombarState();
}

class _bottombarState extends State<bottombar> {
  List<Property> favouriteProperties=[];
  late String _username;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();

    _username = widget.initialUsername ?? 'User';
  }
  late List screens = [
    HomePage(initialUsername:_username),
    FavoritesPage(),
    const AppNotificationsPage(),
    ProfilePage(fullName: _username)
  ];
  @override
  Widget build(BuildContext context) {
    final ThemeData theme= Theme.of(context);
    return MaterialApp( debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screens.elementAt(_currentIndex),
        bottomNavigationBar: NavigationBar(
          indicatorColor: const Color(0x44350f9c),
          elevation: 2,
          surfaceTintColor: const Color(0x44350f9c),
          shadowColor: Colors.blue,
          selectedIndex: _currentIndex,
          onDestinationSelected: (int index){setState(() {
            _currentIndex=index;
          });},



          destinations: const [
            NavigationDestination(

              icon: Icon(Icons.home),
              label: 'Home',


            ),
            NavigationDestination(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    ) ;
  }

}