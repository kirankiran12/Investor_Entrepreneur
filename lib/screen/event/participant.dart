
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/screen/event/ticketdetail.dart';

class Participant extends StatefulWidget {
  const Participant({super.key});

  @override
  State<Participant> createState() => _ParticipantState();
}

class _ParticipantState extends State<Participant> {
  final List<Map<String, String>> participants = [
    {'name': 'Ali', 'id': '@1222', 'image': 'assets/images/men.jpeg'},
    {'name': 'Sarah', 'id': '@2333', 'image': 'assets/images/men.jpeg'},
    {'name': 'Saad', 'id': '@3444', 'image': 'assets/images/men.jpeg'},
    {'name': 'Emma', 'id': '@4555', 'image': 'assets/images/men.jpeg'},
    {'name': 'Ali', 'id': '@5666', 'image': 'assets/images/men.jpeg'},
    {'name': 'Ali', 'id': '@1222', 'image': 'assets/images/men.jpeg'},
    {'name': 'Sarah', 'id': '@2333', 'image': 'assets/images/men.jpeg'},
    {'name': 'Saad', 'id': '@3444', 'image': 'assets/images/men.jpeg'},
    {'name': 'Emma', 'id': '@4555', 'image': 'assets/images/men.jpeg'},
    {'name': 'Ali', 'id': '@5666', 'image': 'assets/images/men.jpeg'},
    {'name': 'Ali', 'id': '@1222', 'image': 'assets/images/men.jpeg'},
    {'name': 'Sarah', 'id': '@2333', 'image': 'assets/images/men.jpeg'},
    {'name': 'Saad', 'id': '@3444', 'image': 'assets/images/men.jpeg'},
    {'name': 'Emma', 'id': '@4555', 'image': 'assets/images/men.jpeg'},
    {'name': 'Ali', 'id': '@5666', 'image': 'assets/images/men.jpeg'},
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                  text: "Participant",
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
            Text(
              'Total Participants: 52,000',
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: ListView.builder(
                itemCount: participants.length,
                itemBuilder: (context, index) {
                  final participant = participants[index];
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: screenWidth * 0.06,
                          backgroundImage: AssetImage(participant['image']!),
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
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.more_vert,
                              size: screenWidth * 0.06, color: Colors.black),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Ticketdetail()),
                            );
                          },
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
