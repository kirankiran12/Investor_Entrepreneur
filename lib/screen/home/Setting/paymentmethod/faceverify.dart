import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/screen/home/Setting/devicepermission.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';

class Faceverify extends StatefulWidget {
  const Faceverify({super.key});

  @override
  _FaceverifyState createState() => _FaceverifyState();
}

class _FaceverifyState extends State<Faceverify> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: screenWidth * 0.07,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CustomText(
                      text: "Face Verification",
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: screenWidth * 0.07), // Spacer for alignment
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Center(
                  child: Text(
                    "Please make sure your face is aligned\nwithin the frame",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    child: Image.asset(
                      'assets/images/faceverify.jpg',
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '100%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        'Verifying your face',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: screenWidth * 0.045,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                SizedBox(height: screenHeight * 0.05),
                Center(
                  child: CustomElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Devicepermission()));
                    },
                    text: 'Verify',
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
