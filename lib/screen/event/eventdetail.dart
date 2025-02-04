
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/widget/outlinegradientbutton.dart';

class Eventdetail extends StatefulWidget {
  const Eventdetail({super.key});

  @override
  _EventdetailState createState() => _EventdetailState();
}

class _EventdetailState extends State<Eventdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     IconButton(
                            icon: Icon(Icons.arrow_back_ios,
                                size: 30, color: Colors.black),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                    CustomText(
                      text: "Event Detail",
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                    CircleAvatar(
                      radius: screenWidth * 0.07,
                      backgroundImage: AssetImage('assets/images/men.jpeg'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/eventdetail.jpeg',
                    width: screenWidth * 0.9,
                    height: screenWidth * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}
