
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
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
                          text: "Terms of Use",
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(width: screenWidth * 0.07), // Spacer for alignment
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      '''These terms of use ("Terms") govern your access to and use of the [app name] mobile application (the "App"). By accessing or using the app, you agree to be bound by these terms.''',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        text: "Who Can Use the App",
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '''You must be at least 13 years old to use the app. If you are under 18, you must have your parent or legal guardian's permission to use the app.''',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        text: "Acceptable Use",
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '''
You agree to use the app only for lawful purposes and in accordance with these terms. You agree not to:
• Use the app to harass, abuse, or threaten others.
• Impersonate any person or entity.
• Post or transmit any content that is unlawful, harmful, threatening, abusive, harassing, defamatory, vulgar, obscene, hateful, or racially or ethically offensive.
• Interfere with or disrupt the services or networks that support the app.
• Use the app to violate any applicable law or regulation.
                      ''',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),
                   
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        text: "Content Ownership",
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '''You retain all ownership rights to the content you post on the app. However, by posting content on the app.''',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: CustomElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Action on agreeing
              },
              text: 'Accept',
            ),
          ),
        ],
      ),
    );
  }
}
