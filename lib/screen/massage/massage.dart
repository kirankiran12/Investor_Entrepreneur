
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/massage/chatscreen.dart';
// import 'package:investorentrepreneur/screen/profile/chatscreen.dart';

class Massagescreen extends StatefulWidget {
  const Massagescreen({super.key});

  @override
  State<Massagescreen> createState() => _MassagescreenState();
}

class _MassagescreenState extends State<Massagescreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  final List<Map<String, String>> _notifications = [
    {
      'name': 'Azita',
      'message': r"yeah sure, let's do it",
      'time': '5 min ago',
      'image': 'assets/images/profile.jpeg',
    },
    {
      'name': 'Aliza',
      'message': 'Your ticket has been confirmed. Continue gaining ticket.',
      'time': '10 min ago',
      'image': 'assets/images/profileimage2.jpeg',
    },
    {
      'name': 'Umer',
      'message': 'Your payment has been processed.',
      'time': '20 min ago',
      'image': 'assets/images/host.jpeg',
    },
    {
      'name': 'Ali',
      'message': 'Event details updated, check now.',
      'time': '15 min ago',
      'image': 'assets/images/men.jpeg',
    },
    {
      'name': 'Amna',
      'message': 'You successfully bought a ticket for the event.',
      'time': '5 min ago',
      'image': 'assets/images/profile.jpeg',
    },
    {
      'name': 'Ayesha',
      'message': 'You successfully bought a ticket for the event.',
      'time': '5 min ago',
      'image': 'assets/images/profile.jpeg',
    },
    {
      'name': 'Ali',
      'message': 'Your payment has been processed.',
      'time': '20 min ago',
      'image': 'assets/images/host.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              _buildHeader(context, screenWidth),
              SizedBox(height: screenHeight * 0.02),
              _buildSearchField(screenWidth),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: _buildNotificationsList(screenWidth),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, double screenWidth) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        Text(
          "Messages",
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchField(double screenWidth) {
    return Container(
      height: screenWidth * 0.12,
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildNotificationsList(double screenWidth) {
    List<Map<String, String>> filteredNotifications = _notifications
        .where((notification) => notification['name']!
                .toLowerCase()
                .contains(_searchQuery) ||
            notification['message']!
                .toLowerCase()
                .contains(_searchQuery))
        .toList();

    return ListView.builder(
      itemCount: filteredNotifications.length,
      itemBuilder: (context, index) {
        final notification = filteredNotifications[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  name: notification['name']!,
                  image: notification['image']!,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.08,
                      backgroundImage: AssetImage(notification['image']!),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification['name']!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            notification['message']!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.normal,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      notification['time']!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 20, thickness: 1, color: Colors.grey),
              ],
            ),
          ),
        );
      },
    );
  }
}
