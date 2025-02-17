
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/screen/home/Setting/myeventricket.dart';

class Myevent extends StatefulWidget {
  const Myevent({super.key});

  @override
  State<Myevent> createState() => _MyeventState();
}

class _MyeventState extends State<Myevent> {
  final List<Map<String, String>> events = [
    {
      'image': 'assets/images/politics.jpeg',
      'category': 'Tech',
      'Country': 'United State'
    },
    {
      'image': 'assets/images/tech.jpeg',
      'category': 'Politics',
      'Country': 'United State'
    },
    {
      'image': 'assets/images/business.jpeg',
      'category': 'Startup',
      'Country': 'Feb 10, 2025'
    },
    {
      'image': '  assets/images/networking.jpeg',
      'category': 'Politics',
      'Country': 'United State'
    },
    {
      'image': '  assets/images/marketing.jpeg',
      'category': 'Politics',
      'Country': 'United State'
    },
    {
      'image': 'assets/images/business.jpeg',
      'category': 'Startup',
      'Country': 'Feb 10, 2025'
    },
    {
      'image': 'assets/images/technology.jpeg',
      'category': 'Business',
      'Country': 'Mar 15, 2025'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios,
                      size: screenWidth * 0.06, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CustomText(
                  text: "My Ticket",
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                ),
                // IconButton(onPressed: () {}, icon: Icon(Icons.share)
                // )
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      screenWidth > 600 ? 3 : 2, // Adjust for larger screens
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8, // Adjust card size ratio
                ),
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return _buildEventCard(
                    events[index]['image']!,
                    events[index]['category']!,
                    events[index]['Country']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(String imagePath, String category, String date) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.bookmark_outline,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 57, 57, 57).withOpacity(0.5),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Ticket()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.3),
                        ),
                        child: const Text(
                          'Buy Ticket',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.share, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Ticket()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
