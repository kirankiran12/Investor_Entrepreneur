import 'package:flutter/material.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';

// ignore: camel_case_types
class createreviews extends StatefulWidget {
  const createreviews({super.key});

  @override
  State<createreviews> createState() => _createreviewsState();
}

// ignore: camel_case_types
class _createreviewsState extends State<createreviews> {
  final TextEditingController _textcontroller = TextEditingController();
  int _starRating = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.1),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 8),
                  Text("Add Reviews",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              ),
              SizedBox(height: 20),
              Divider(color: Colors.black),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Rate your Experience",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  for (int i = 1; i <= 5; i++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _starRating = i;
                        });
                      },
                      child: Icon(
                        Icons.star,
                        size: 30,
                        color: i <= _starRating ? Colors.amber : Colors.grey,
                      ),
                    ),
                  Text(" ($_starRating)",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Write your Review",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _textcontroller,
                maxLength: 100,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Write your review.......",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  hintStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: screenHeight * 0.2),
              CustomElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Submit Reviews',
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
