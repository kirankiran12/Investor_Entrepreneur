
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:investorentrepreneur/common/app_color.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/loginscreen/signin.dart';

import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
import 'package:investorentrepreneur/widget/custom_textformfield.dart';
import 'package:investorentrepreneur/widget/rectangleshapeElevated%20widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
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
                  text: "Let’s Get Started 🚀!",
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

              Text(
                "Select your Role",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  RectangleElevated(onPressed: () {}, text: "Entrepreneur",),
                  RectangleElevated(onPressed: () {}, text: "Investor"),
                  RectangleElevated(onPressed: () {}, text: "Viewer"),
                ],
              ),
              const SizedBox(height: 20),

             Row(
               children: [
                 Checkbox(
                           value: isChecked,
                           activeColor: Colors.blue, // Color when checked
                           onChanged: (bool? newValue) {
                             setState(() {
                  isChecked = newValue!;
                             });
                           },
                         ),
              
             
        const Text(
          "Remember me",
          style: TextStyle(fontSize: 16),
        ),]),

              Center(
                child: CustomElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Welcomeback()),
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
              const SizedBox(height: 40),

              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'By proceeding you agree to investors',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: ' Terms of Use ',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppColor.blueColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy ',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppColor.blueColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    " Already have an account? ",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
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
