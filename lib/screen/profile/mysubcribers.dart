import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/event/ticketdetail.dart';

class Mysubcribers extends StatefulWidget {
  const Mysubcribers({super.key});

  @override
  State<Mysubcribers> createState() => _MysubcribersState();
}

class _MysubcribersState extends State<Mysubcribers> {

   final List<Map<String, String>> Mysubcribers= [
    {'name': 'Ali', 'id': 'Ali@1222', 'image': 'assets/images/men.jpeg'},
    {'name': 'Sarah', 'id': 'Sarah@2333', 'image': 'assets/images/men.jpeg'},
    {'name': 'Saad', 'id': 'Saad@3444', 'image': 'assets/images/men.jpeg'},
    {'name': 'Emma', 'id': 'Emma@4555', 'image': 'assets/images/men.jpeg'},
    {'name': 'Ali', 'id': 'Ali@5666', 'image': 'assets/images/men.jpeg'},
    {'name': 'Ali', 'id': 'Ali@1222', 'image': 'assets/images/men.jpeg'},
    {'name': 'Sarah', 'id': 'Sarah@2333', 'image': 'assets/images/men.jpeg'},
    {'name': 'Saad', 'id': 'Saad@3444', 'image': 'assets/images/men.jpeg'},
    {'name': 'Emma', 'id': 'Emma@4555', 'image': 'assets/images/men.jpeg'},
    {'name': 'Ali', 'id': 'Ali@5666', 'image': 'assets/images/men.jpeg'},
    {'name': 'Ali', 'id': 'Ali@1222', 'image': 'assets/images/men.jpeg'},
    {'name': 'Sarah', 'id': 'Sarah@2333', 'image': 'assets/images/men.jpeg'},
    {'name': 'Saad', 'id': 'Saad@3444', 'image': 'assets/images/men.jpeg'},
    {'name': 'Emma', 'id': 'Emma@4555', 'image': 'assets/images/men.jpeg'},
    {'name': 'Ali', 'id': 'Aali@5666', 'image': 'assets/images/men.jpeg'},
  ];
  @override
  Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return 
     
      Scaffold(
        backgroundColor: Colors.white,
        body: Column(
        children: [
           SizedBox(height: 10,),
          Row(
            children: [
              Text(
                  'Total Subscribers: 52,000',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.separated(
                itemCount: Mysubcribers.length,
                separatorBuilder: (context, index) => const Divider(
                  
                  
                  height: 10,
                ),
                itemBuilder: (context, index) {
                  final participant = Mysubcribers[index];
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
                                  color: Colors.black,
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
            
          
        
      ]),);
    
  }
}

