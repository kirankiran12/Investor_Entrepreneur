import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/app_color.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/screen/home/homescreen.dart';

import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
import 'package:investorentrepreneur/widget/custom_textformfield.dart';

class Welcomeback extends StatefulWidget {
  const Welcomeback({super.key});

  @override
  State<Welcomeback> createState() => _WelcomebackState();
}

class _WelcomebackState extends State<Welcomeback> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, // Responsive padding
          vertical: 50,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomText(
                  text: "Welcome back 👋!",
                  fontSize: 28, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: emailController,
                hint: 'Email',
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: passwordController,
                hint: 'Password',
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const Forgetscreen(),
                  //   ),
                  // );
                },
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: const Text('Forgot Password?')),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(children: [
                Checkbox(
                  value: isChecked,
                  activeColor: Colors.black, // Color when checked
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                ),
                const Text(
                  "Remember me",
                  style: TextStyle(fontSize: 16),
                ),
              ]),
              Center(
                child: CustomElevatedButton(
                 onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homescreen()),
                      );
                    },
                  text: 'Sign up',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Continue with",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 15,
                runSpacing: 10,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[200],
                    child: Image.asset('assets/images/instagram.png'),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[200],
                    child: Image.asset('assets/images/linkin.png'),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[200],
                    child: Image.asset('assets/images/youtube.png'),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[200],
                    child: Image.asset('assets/images/facebok.png'),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[200],
                    child: Image.asset('assets/images/call.png'),
                  ),
                ],
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    " Already have an account? ",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homescreen()),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColor.blueColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
