
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final List<Map<String, dynamic>> participants = [
    {'name': 'Ali', 'id': 'Ali@1222', 'image': 'assets/images/men.jpeg', 'subscribed': false},
    {'name': 'Sarah', 'id': 'Sarah@2333', 'image': 'assets/images/men.jpeg', 'subscribed': false},
    {'name': 'Saad', 'id': 'Saad@3444', 'image': 'assets/images/men.jpeg', 'subscribed': false},
    {'name': 'Emma', 'id': 'Emma@4555', 'image': 'assets/images/men.jpeg', 'subscribed': false},
    {'name': 'Ali', 'id': 'Ali@5666', 'image': 'assets/images/men.jpeg', 'subscribed': false},
       {'name': 'Ali', 'id': 'Ali@1222', 'image': 'assets/images/men.jpeg', 'subscribed': false},
     {'name': 'Sarah', 'id': 'Sarah@2333', 'image': 'assets/images/men.jpeg', 'subscribed': false},
    {'name': 'Saad', 'id': 'Saad@3444', 'image': 'assets/images/men.jpeg', 'subscribed': false},
    {'name': 'Emma', 'id': 'Emma@4555', 'image': 'assets/images/men.jpeg', 'subscribed': false},
    {'name': 'Ali', 'id': 'Ali@5666', 'image': 'assets/images/men.jpeg', 'subscribed': false},
    {'name': 'Ali', 'id': 'Ali@1222', 'image': 'assets/images/men.jpeg', 'subscribed': false},
    {'name': 'Sarah', 'id': 'Sarah@2333', 'image': 'assets/images/men.jpeg', 'subscribed': false},
    {'name': 'Saad', 'id': 'Saad@3444', 'image': 'assets/images/men.jpeg', 'subscribed': false},
    {'name': 'Emma', 'id': 'Emma@4555', 'image': 'assets/images/men.jpeg', 'subscribed': false},
    {'name': 'Ali', 'id': 'Aali@5666', 'image': 'assets/images/men.jpeg', 'subscribed': false},
  ];

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<Map<String, dynamic>> filteredParticipants = participants
        .where((participant) =>
            participant['name']!.toLowerCase().contains(searchText.toLowerCase()) ||
            participant['id']!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.050),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios,
                      size: screenWidth * 0.07, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CustomText(
                  text: "Contacts Access",
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                ),
                CircleAvatar(
                  radius: screenWidth * 0.06,
                  backgroundImage: AssetImage('assets/images/men.jpeg'),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            // Search TextField
            TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: "Search user",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: filteredParticipants.isEmpty
                  ? Center(
                      child: Text(
                        "No users found.",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: filteredParticipants.length,
                      separatorBuilder: (context, index) => const Divider(
                        height: 10,
                      ),
                      itemBuilder: (context, index) {
                        final participant = filteredParticipants[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: screenWidth * 0.06,
                                backgroundImage:
                                    AssetImage(participant['image']!),
                              ),
                              SizedBox(width: screenWidth * 0.03),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      participant['name']!,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.045,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      participant['id']!,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.035,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: participant['subscribed']
                                      ?  Color.fromARGB(255, 211, 210, 210)
                                          .withOpacity(0.4)
                                       :Color.fromARGB(255, 15, 3, 241).withOpacity(0.4)
                                       
                                ),
                                onPressed: () {
                                  setState(() {
                                    participant['subscribed'] =
                                        !participant['subscribed'];
                                  });
                                },
                                child: Text(
                                  participant['subscribed']
                                      ? 'Subscribed'
                                      : 'Subscribe',
                                  style: TextStyle(
                                    color: participant['subscribed']
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
