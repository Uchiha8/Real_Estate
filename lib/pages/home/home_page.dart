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
  final int? userId;
  final String? token;

  HomePage({this.userId, this.token});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _username;
  late double screenHeight;
  late String currentDate;
  late TextEditingController searchController;
  late bool isLoading;


  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _username = widget.userId ?? 3;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenHeight = MediaQuery.of(context).size.height;
    currentDate = DateFormat('MMMMEEEEd').format(DateTime.now());
  }

  void updateUsername(int newUsername) {
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
        description: """A "Beautiful Villa" is more than just a house; it's a captivating haven that intertwines elegance with comfort. Imagine a residence where architectural mastery meets nature's embrace, creating a harmonious blend of luxury and tranquility.

As you approach, the villa stands as a testament to exquisite design, featuring graceful lines, captivating details, and an aura of sophistication. The exterior, a picturesque canvas, showcases meticulous landscaping, perhaps framed by swaying palms or nestled against a backdrop of rolling hills.

Upon entering, you're welcomed by a sense of openness. The interiors boast expansive spaces adorned with tasteful decor, where every element has been carefully chosen to evoke a feeling of opulence. Sunlight filters through large windows, casting a warm glow that accentuates the carefully curated furnishings.

The heart of this beautiful villa is not just the structure itself but the lifestyle it offers. Imagine waking up to stunning views from a master suite that feels like a sanctuary. Picture a gourmet kitchen, a space where culinary artistry meets modern convenience, inviting you to create and entertain.

Step outside, and the villa unfolds into a private oasis. A well-designed garden surrounds a sparkling pool, creating a retreat where the boundaries between indoor and outdoor living blur. It's a space for relaxation, for basking in the sun or enjoying an evening under the stars.

Luxurious amenities abound – perhaps a spa-like bathroom, a home theater, or a cozy fireplace for intimate gatherings. Each room tells a story of meticulous craftsmanship and attention to detail.

Privacy is paramount, with the villa ideally situated to offer seclusion while maintaining a connection to the beauty that surrounds it. Whether perched on a hillside or nestled within a gated community, this residence provides a retreat from the bustle of the world.

A "Beautiful Villa" transcends the notion of a mere dwelling; it embodies a lifestyle. It's an investment in not just a property but in a curated experience that elevates daily living to an art form. This is where the canvas of your life is painted with moments of serenity, beauty, and the luxury of being at home.""",
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
                              "Welcome, $_username",
                              style: TextStyle(
                                fontSize: 24,
                                color: Color(0xcc350f9c),
                                fontWeight: FontWeight.w500,
                              ), overflow: TextOverflow.clip,
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
                      decoration: const BoxDecoration(
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
  final int? userId;
  final String? token;
  const bottombar({required this.userId, required this.token});



  @override
  State<bottombar> createState() => _bottombarState();
}

class _bottombarState extends State<bottombar> {
  List<Property> favouriteProperties=[];
  late int _userId;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();

    _userId = widget.userId ?? 0;
  }
  late List screens = [
    HomePage(userId:_userId, token: widget.token),
    FavoritesPage(),
    const AppNotificationsPage(),
    ProfilePage(fullName: _userId)
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