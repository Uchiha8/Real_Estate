import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_estate/models/enums/currency.dart';
import 'package:real_estate/models/image_model.dart';
import 'widgets/icon_text.dart';
import 'package:real_estate/pages/search/search_page.dart';
import 'widgets/property_card.dart';
import 'package:real_estate/models/property_model.dart';
import 'widgets/section_heading.dart';
import 'package:real_estate/pages/property_details/property_details.dart';
import 'package:real_estate/pages/favorites/favorites_page.dart';
import 'package:real_estate/pages/profile/profile.dart';
import 'package:real_estate/pages/notifications/app_notifications_page.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'view_all.dart';
import 'dart:async';

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

  List<Property> onRentProperties = [

  ];
  List<Property> onSaleProperties = [

  ];


  @override
  void initState()  {
    super.initState();
    searchController = TextEditingController();
    _username = widget.userId ?? 3;
   fetchData();

  }
  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Fetch featured properties
      final onSaleResponse = await http.get(
        Uri.parse('https://vivahomes.uz/v1/estates/?rent=false'),
      );
      if (onSaleResponse.statusCode == 200) {
        final onSaleJson = json.decode(onSaleResponse.body);
        onSaleProperties = (onSaleJson as List)
            .map((property) => Property.fromJson(property))
            .toList();
      } else {
        throw Exception('Failed to load featured properties');
      }

      // Fetch trending properties
      final onRentResponse = await http.get(
        Uri.parse('https://vivahomes.uz/v1/estates/?rent=true'));
      if (onRentResponse.statusCode == 200) {
        final onRentJson = json.decode(onRentResponse.body);
        onRentProperties = (onRentJson as List)
            .map((property) => Property.fromJson(property))
            .toList();
        print(onRentProperties[1].images.images);
      } else {
        throw Exception('Failed to load trending properties');
      }
    } catch (error) {
      print('Error fetching data: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
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
if(isLoading){return Center(child: CircularProgressIndicator(color: Colors.blue));} else{


    final now = DateTime.now();
    String currentDate = DateFormat('MMMMEEEEd').format(now);
    final TextEditingController searchController = TextEditingController();
    bool isLoading = false;



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
                      onTap: () async {
                        List<Property> properties = [];
                        if (searchController.text.isNotEmpty) {
                          String searchText = searchController.text;
                          final response = await http.get(Uri.parse('https://vivahomes.uz/v1/estates/?search=$searchText'));
                          if (response.statusCode == 200) {
                            final List<dynamic> data = jsonDecode(response.body);

                              properties = data.map((json) => Property.fromJson(json)).toList();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SearchPage(properties: properties  ),
                              ),
                            );
                          } else {
                            // Handle error when performing search
                            print('Error performing search. Status code: ${response.statusCode}');
                          }


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

                text: "On Sale" ,

                onTap: () {
                 Navigator.push(context,  MaterialPageRoute(
                    builder: (context) => ViewAllPage(properties: onSaleProperties),
                  ));
                },
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
                    itemCount: onSaleProperties.length,
                    itemBuilder: (ctx, index) {
                      return PropertyCard(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PropertyDetailsPage(
                                property: onSaleProperties[index],
                              ),
                            ),
                          );
                        },
                        property: onSaleProperties[index],                            );
                    },
                  ),
                ),
              ),
              SectionHeading(text: "On Rent", onTap: () {Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewAllPage(properties: onRentProperties),
                ),
              );}),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.blue)
                    : Container(
                  width: double.infinity,
                  height: 350.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: onRentProperties.length,
                    itemBuilder: (ctx, index) {
                      return PropertyCard(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PropertyDetailsPage(
                                property: onRentProperties[index],
                              ),
                            ),
                          );
                        },
                        property: onRentProperties[index],
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
  }}
}

class bottombar extends StatefulWidget {
  final int? userId;
  final String? token;
  const bottombar({required this.userId, required this.token});



  @override
  State<bottombar> createState() => _bottombarState();
}

class _bottombarState extends State<bottombar> {

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