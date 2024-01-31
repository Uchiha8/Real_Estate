import 'package:flutter/material.dart';
import 'package:real_estate/models/property_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';
class PropertyDetailsPage extends StatefulWidget {
  final Property property;

  const PropertyDetailsPage({Key? key, required this.property}) : super(key: key);

  @override
  _PropertyDetailsPageState createState() => _PropertyDetailsPageState();
}

class _PropertyDetailsPageState extends State<PropertyDetailsPage> {
  bool showFullDescription = false;

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
                      imageProvider: AssetImage('images/house.jpg'),
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffccd5f0).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Image.asset(
                  'images/house.jpg',
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
                  Text(
                    widget.property.title ?? '',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff350f9c)),
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
                        'Price: \$${widget.property.price ?? ""}',
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
                          content: GestureDetector(onTap: (){_launchPhone('+998 99 999 99 99');},child: Text("Phone: +998 99 999 99 99\nEmail: agent_boyan@email.idk",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff350f9c)),)),));
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
