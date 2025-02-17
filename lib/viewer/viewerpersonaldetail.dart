import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';

import 'package:investorentrepreneur/viewer/editviewerpersonaldetail.dart';

class Viewerpersonaldetail extends StatefulWidget {
  const Viewerpersonaldetail({super.key});

  @override
  State<Viewerpersonaldetail> createState() => _ViewerpersonaldetailState();
}

class _ViewerpersonaldetailState extends State<Viewerpersonaldetail> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.chevron_left_rounded,
                        size: screenWidth * 0.08, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomText(
                    text: "Personal Details",
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const EditViewerpersonaldetail()),
                      );
                    },
                    child: Text(
                      "Edit Detail",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.045,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const Icon(Icons.edit, size: 15, color: Colors.blue),
                  Spacer(),
                  Icon(Icons.chevron_right,
                      size: screenWidth * 0.06, color: Colors.blue),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'Total Subscriber',
                style: TextStyle(
                    fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
              ),
              Text(
                '53,324 Subscriber',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: screenHeight * 0.04),
              Text(
                'Description',
                style: TextStyle(
                    fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "I am [Entrepreneur's Name], a passionate investor dedicated to reshaping industries. With creativity and resilience, I thrive in the entrepreneurial realm, turning challenges into opportunities. Join me as I make my mark on the World. ",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          print("Read More Clicked!");
                        },
                        child: Text(
                          'Read More',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'Personal Details',
                style: TextStyle(
                    fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildDetailRow("Name", "Azita Darvishi", screenWidth),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              _buildDetailRow("Work Experience", "5 years", screenWidth),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              _buildDetailRow("Education", " Marketing", screenWidth),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              _buildDetailRow("Location", "IPO", screenWidth),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              SizedBox(height: 10),
              Text(
                'Links',
                style: TextStyle(
                    fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/images/emal.png',
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'AzitaDarvishi@gmail.com',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/linkin.png',
                        width: 50,
                        height: 40,
                      ),
                      Container(
                        child: Text(
                          'Linkedin',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        '@Azita123',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, double screenWidth) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        Spacer(),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
