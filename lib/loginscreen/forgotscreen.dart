import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/loginscreen/donepasswoed.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';

import 'package:investorentrepreneur/widget/custom_textformfield.dart';

class Forgotscreen extends StatefulWidget {
  const Forgotscreen({super.key});

  @override
  State<Forgotscreen> createState() => _ForgotscreenState();
}

class _ForgotscreenState extends State<Forgotscreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final noController = TextEditingController();
  final dateController = TextEditingController();
  final passwordController = TextEditingController();

  String? selectedCountryCode;
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.03,
          ),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.chevron_left_sharp,
                        size: 30, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: "Change Password",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Current password*',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                CustomTextFormField(
                  controller: nameController,
                  hint: 'Current password',
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'New password',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                CustomTextFormField(
                  controller: dateController,
                  hint: 'New password',
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Re_type new password',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                CustomTextFormField(
                  controller: emailController,
                  hint: 'Re_type new password',
                ),
                const SizedBox(height: 50),
                Center(
                  child: Column(children: [
                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DonepasswordScreen()));
                      },
                      text: '  "Change password',
                    ),
                  ]),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
