import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:investorentrepreneur/common/app_color.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/enterpereneur/personaldetal.dart';
import 'package:investorentrepreneur/Investor/investorpersonaldetail.dart';
import 'package:investorentrepreneur/viewer/viewerpersonaldetail.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
import 'package:investorentrepreneur/widget/custom_textformfield.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  bool _obscureText1 = false;
  String selectedRole = "";

  String? emailError;
  String? passwordError;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final cred = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

      return await _auth.signInWithCredential(cred);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  bool isValidEmail(String email) {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  bool isValidPassword(String password) {
    return password.length >= 6;
  }

  void signUpUser() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    setState(() {
      emailError = null;
      passwordError = null;
    });

    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill in all fields");
      return;
    }

    if (!isValidEmail(email)) {
      setState(() {
        emailError = "Invalid email format!";
      });
      return;
    }

    if (!isValidPassword(password)) {
      setState(() {
        passwordError = "Password must be at least 6 characters!";
      });
      return;
    }

    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Fluttertoast.showToast(msg: "Sign Up Successful!");

      if (selectedRole == "Entrepreneur") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Personaldetal()),
        );
      } else if (selectedRole == "Investor") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const InvestorPersonaldetal()),
        );
      } else if (selectedRole == "Viewer") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Viewerpersonaldetail()),
        );
      } else {
        Fluttertoast.showToast(msg: "Please select a role.");
      }
    }).catchError((error) {
      Fluttertoast.showToast(msg: "Sign Up Failed: ${error.message}");
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: 50,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomText(
                  text: "Let’s Get Started 🚀!",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: emailController,
                hint: 'Email',
                errorText: emailError,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: passwordController,
                hint: 'Password',
                obscureText: _obscureText1,
                errorText: passwordError,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText1 ? Icons.visibility : Icons.visibility_off,
                    size: 15,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText1 = !_obscureText1;
                    });
                  },
                ),
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
                  _buildRoleButton(
                      "Entrepreneur", selectedRole == "Entrepreneur", () {
                    setState(() => selectedRole = "Entrepreneur");
                  }),
                  _buildRoleButton("Investor", selectedRole == "Investor", () {
                    setState(() => selectedRole = "Investor");
                  }),
                  _buildRoleButton("Viewer", selectedRole == "Viewer", () {
                    setState(() => selectedRole = "Viewer");
                  }),
                ],
              ),
              const SizedBox(height: 20),
              Row(children: [
                Checkbox(
                  value: isChecked,
                  activeColor: Colors.blue,
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
                  onPressed: signUpUser,
                  text: 'Sign Up',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Continue with",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(child: Divider(color: Colors.grey, thickness: 1)),
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
                        fontSize: 16, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: ' Terms of Use ',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppColor.blueColor,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'and ',
                          style: GoogleFonts.inter(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Privacy Policy ',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppColor.blueColor,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButton(
      String text, bool isSelected, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.purple,
                    Colors.red,
                    Colors.orange
                  ],
                )
              : null,
          color: isSelected ? null : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
