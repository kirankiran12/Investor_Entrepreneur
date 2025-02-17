import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/home/Setting/paymentmethod/answernow.dart';

class CustomScreen1 extends StatelessWidget {
  const CustomScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(screenWidth * 0.1),
              bottomRight: Radius.circular(screenWidth * 0.1),
            ),
            child: Image.asset(
              'assets/images/question.jpeg',
              width: screenWidth,
              height: screenHeight * 0.35,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [SizedBox(height: 30,),
                Text(
                  "Face Verification",
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Lets Answer the question in your profile to let the people know more about yourself",
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1,
              vertical: screenHeight * 0.02,
            ),
            child: ElevatedButton(
              onPressed: () {
 Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>CustomScreen2 ()));

              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  const Color.fromARGB(255, 18, 11, 235),
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
              ),
              child: Center(
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
