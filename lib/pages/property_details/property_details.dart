import 'package:flutter/material.dart';
import 'package:real_estate/models/property_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert';
import 'package:real_estate/models/agent_model.dart';
import 'package:http/http.dart' as http;
class PropertyDetailsPage extends StatefulWidget {
  final Property property;

  const PropertyDetailsPage({Key? key, required this.property}) : super(key: key);

  @override
  _PropertyDetailsPageState createState() => _PropertyDetailsPageState();
}


class _PropertyDetailsPageState extends State<PropertyDetailsPage> {
  bool showFullDescription = false;
  Agent? agent;
@override
  void initState() {
  fetchAgentInfo();
    super.initState();
  }

    Future<void> fetchAgentInfo() async {
      try {
        // Replace 'YOUR_AGENT_API_ENDPOINT' with the actual API endpoint for fetching agent details
        final response = await http.get(
          Uri.parse('https://vivahomes.uz/v1/agents/${widget.property.agent}'),
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> agentData = json.decode(response.body);
          setState(() {
            agent = Agent.fromJson(agentData);
          });
        } else {
          print('Failed to load agent details. Status code: ${response.statusCode}');
        }
      } catch (error) {
        print('Error fetching agent details: $error');
      }
    }


  @override
  Widget build(BuildContext context) {
    String description = widget.property.description ?? '';

    String truncatedDescription =
    showFullDescription ? description : (description.length > 200 ? description.substring(0, 200) + '...' : description);

    return Scaffold(
      backgroundColor: Color(0xffccd5f0).withOpacity(1),
      appBar: AppBar(
        backgroundColor: Colors.transparent.withOpacity(0),
        automaticallyImplyLeading: true,
        title: Text(widget.property.title ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                print('tapped');
                showDialog(
                  context: context,
                  builder: (context) => GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: PhotoView(
                      gestureDetectorBehavior: HitTestBehavior.translucent,
                      backgroundDecoration: BoxDecoration(color: Colors.transparent),
                      imageProvider: CachedNetworkImageProvider(widget.property.images.images ),
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffccd5f0).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: CachedNetworkImage(
                  imageUrl:widget.property.images.images ,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.property.title ?? '',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff350f9c)),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Custom logic to toggle bookmark
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,

                          decoration: BoxDecoration(
                            color: const Color(0xffccd5f0).withOpacity(0.2),
                      backgroundBlendMode: BlendMode.colorBurn,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child:  Icon(
                            Icons.favorite_border,
                            size: 30.0,
                            color: const Color(0xffffffff).withOpacity(0.6),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffdde5ff).withOpacity(1),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       

                        // Two-column layout for Property Details
                        Row(
                          children: [
                            // Left Column
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Room Numbers
                                  Row(
                                    children: [
                                      Icon(Icons.king_bed, color: Color(0xff350f9c)),
                                      SizedBox(width: 5),
                                      Text('Rooms: ${widget.property.bedrooms ?? "N/A"}'),
                                    ],
                                  ),

                                  // Bathrooms
                                  Row(
                                    children: [
                                      Icon(Icons.bathtub, color: Color(0xff350f9c)),
                                      SizedBox(width: 5),
                                      Text('Bathrooms: ${widget.property.bathrooms?? "N/A"}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Right Column
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Area
                                  Row(
                                    children: [
                                      Icon(Icons.square_foot, color: Color(0xff350f9c)),
                                      SizedBox(width: 5),
                                      Text('Area: ${widget.property.bathrooms?? "N/A"} sqft'),
                                    ],
                                  ),

                                  // Status
                                  Row(
                                    children: [
                                      Icon(Icons.info, color: Color(0xff350f9c)),
                                      SizedBox(width: 5),
                                      Text('Status: ${widget.property.type ?? "N/A"}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                  Text(
                    'Description:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff350f9c)),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showFullDescription = !showFullDescription;
                      });
                    },
                    child: Text(
                      showFullDescription ? description : truncatedDescription,
                      style: TextStyle(fontSize: 16, color: Color(0xff350f9c)),
                    ),
                  ),
                  if (description.length > 200)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            showFullDescription = !showFullDescription;
                          });
                        },
                        child: Text(
                          showFullDescription ? 'View Less' : 'View More',
                          style: TextStyle(letterSpacing: 1.2,textBaseline: TextBaseline.ideographic,fontSize: 18, color: Color(0xff350f9c), ),
                        ),
                      ),
                    ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Market Value: ${widget.property.currency} ${widget.property.marketValue ?? ""}',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff350f9c)),
                      ),
                    ],



                  ),
                  Row(children: [SizedBox(width: 150,),
                  Container(height: 2,width: 210,color: Color(0xff350f9c),)],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Price: ${widget.property.currency} ${widget.property.price ?? ""}',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff350f9c)),
                      ),
                    ],



                  ),
                  SizedBox(height: 25),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                        showDialog(context: context, builder: (context) => AlertDialog(
                          title: Text("Contact", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xff350f9c)),),
                          content: GestureDetector(onTap: (){_launchPhone(agent?.contact.phone);},child: Text("${agent?.contact.phone}\nEmail: agent_boyan@email.idk",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff350f9c)),)),));
                      }, child: Text("Contacts",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xffffffff)),),
                          style: ElevatedButton.styleFrom(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            backgroundColor: const Color(0xff350f9c),
                          ),

                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _launchPhone(String? phoneNumber) async {
    if (phoneNumber != null) {
      await launchUrl(Uri.parse('tel:$phoneNumber'));
    } else {
      print('Could not launch phone app');
    }
  }
}
