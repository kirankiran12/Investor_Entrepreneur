import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/home/filter/filterscreen.dart';
import 'package:investorentrepreneur/home/mapscreen/map.dart';
import 'package:investorentrepreneur/screen/event/eventdetail.dart';

class EventScreenContent extends StatefulWidget {
  @override
  _EventScreenContentState createState() => _EventScreenContentState();
}

class _EventScreenContentState extends State<EventScreenContent> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  int _selectedTab = 0;
  final List<String> _tabs = ["All", "Category", "Location", "Date"];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding:
          EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 50),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Event",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Mapscreen()),
                    );
                  },
                  icon: Icon(Icons.location_on_rounded),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[200],
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Filterscreen()),
                      );
                    },
                    icon: Icon(Icons.add),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_tabs.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: _selectedTab == index
                          ? LinearGradient(colors: [
                              Colors.blue,
                              Colors.purple,
                              Colors.red,
                              Colors.orange
                            ])
                          : null,
                      color: _selectedTab == index ? null : Colors.grey[300],
                    ),
                    child: Row(
                      children: [
                        Text(
                          _tabs[index],
                          style: TextStyle(
                            color: _selectedTab == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        if (index != 0)
                          Icon(Icons.arrow_drop_down, color: Colors.black),
                      ],
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildEventCard('assets/images/politics.jpeg', 'Politics',
                      'Feb 10, 2025'),
                  _buildEventCard(
                      'assets/images/tech.jpeg', 'Tech', 'Mar 15, 2025'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomText(
              text: "Suggested Events",
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildSuggestedEvent(
                      "assets/images/business.jpeg", "Business"),
                  _buildSuggestedEvent("assets/images/finance.jpeg", "Finance"),
                  _buildSuggestedEvent(
                      "assets/images/networking.jpeg", "Networking"),
                  _buildSuggestedEvent(
                      "assets/images/technology.jpeg", "Technology"),
                  _buildSuggestedEvent(
                      "assets/images/marketing.jpeg", "Marketing"),
                ],
              ),
            ),
            SizedBox(height: 10,),
SizedBox(
  height: 250,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
       _buildEventCard('assets/images/business.jpeg', 'Business',
                      'Feb 10, 2025'),
                  _buildEventCard(
                      'assets/images/technology.jpeg', 'Technology', 'Mar 15, 2025'),
    ],
  ),
)




          ],
        ),
      ),
    );
  }

  Widget _buildSuggestedEvent(String imagePath, String category) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Positioned(
            bottom: 2,
            child: Container(
              width: 100,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(String imagePath, String category, String date) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 10,
              right: 10,
              child: Icon(
                Icons.bookmark_outline,
                color: Colors.white,
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15),top: Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    date,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                           Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Eventdetail()),
                      );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.3)),
                        child: Text('Buy Ticket',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ),
                      IconButton(
                        icon: Icon(Icons.share, color: Colors.white),
                        onPressed: () {},
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
