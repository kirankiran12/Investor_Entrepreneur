import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';

import 'package:investorentrepreneur/widget/custom_textformfield.dart';

class Profileinfo extends StatefulWidget {
  const Profileinfo ({super.key});

  @override
  State<Profileinfo > createState() => _ProfileinfoState();
}

class _ProfileinfoState extends State<Profileinfo > {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final noController = TextEditingController();
  final dateController = TextEditingController();
  final passwordController = TextEditingController();

String? selectedCountryCode; // For saving the selected country code
  String? phoneNumber;  

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                    icon: Icon(Icons.chevron_right_sharp,
                        size: screenWidth * 0.06, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: "Profile information",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),

                       Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                       Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Profileinfo()),
                          );
                                    },
                                    child: const Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  const Icon(Icons.edit,
                                      size: 20, color: Colors.blue),
                                ],
                              ),
                            
                    ],
                  ),
                ],
              ),SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'personal information',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Full name*',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  CustomTextFormField(
                    controller: nameController,
                    hint: 'name',
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Date of birth',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  CustomTextFormField(
                    controller: dateController,
                    hint: '03 june 2007',
                  ),
                  const SizedBox(height: 15), const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Account information',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    hint: 'abc123@gmail.com',
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Phone Number',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                 
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Password*',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    hint: '*********',
                  ),
                  const SizedBox(height: 15),
                ]
          ),]
        ),
      ),)
    );
  }
}
