import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/screen/home/Setting/privacypolicy/termsuse.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
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
                text: "Privacy Policy",
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(width: screenWidth * 0.07), // Spacer for alignment
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              '''Your privacy is important tu us.this privacy policy explains how [ App name]["we","us","or","our"] collect,uses and disclose  your informaton when you use your mobile application[the app]'''),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: "Information we Collect",
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: screenWidth * 0.07), //
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                '''
Welcome to our app. This privacy policy explains how we collect, use, and protect your personal information.
• Account Information: When you create an account,we collect your name ,email address, password and any other information you choose to provide.

• Profile Information: You can choose to add information to your profile,such  as your work experience, educations,skill,interests. 

• Connection Information: You can choose to connect with other users on the app.we store information about your connection such their name and contact information.

• Usage Information: We collect your information about how you use the app, such as the pages you visit the searches you conduct and the feature you use.

• Device Information: You collect information about the device you use to access the app such as the device type,opreatng system. and IP adress

Thank you for using our app!


                  ''',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          CustomElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TermsOfUse()));
            },
            text: 'Agree',
          ),
        ]),
      ),
    );
  }
}
