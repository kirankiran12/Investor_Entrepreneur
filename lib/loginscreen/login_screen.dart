
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:investorentrepreneur/common/app_color.dart';
// import 'package:investorentrepreneur/common/customtext.dart';
// import 'package:investorentrepreneur/loginscreen/forgotscreen.dart';
// import 'package:investorentrepreneur/loginscreen/signup_screen.dart';
// import 'package:investorentrepreneur/screen/home/homescreen.dart';
// import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
// import 'package:investorentrepreneur/widget/custom_textformfield.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class WelcomeBackScreen extends StatefulWidget {
//   const WelcomeBackScreen({super.key});

//   @override
//   State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
// }

// class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   bool isChecked = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void signIn() async {
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//      Fluttertoast.showToast(msg: "Please enter email and password");
//       return;
//     }

//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
      
//       Fluttertoast.showToast(msg: "Successful Login");
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const Homescreen()),
//       );
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Invalid email or password");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(
//           horizontal: screenWidth * 0.05,
//           vertical: 50,
//         ),
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: CustomText(
//                   text: "Welcome back 👋!",
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 15),
//               CustomTextFormField(
//                 controller: emailController,
//                 hint: 'Email',
//               ),
//               const SizedBox(height: 20),
//               CustomTextFormField(
//                 controller: passwordController,
//                 hint: 'Password',
//               ),
//               const SizedBox(height: 20),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const Forgotscreen(),
//                     ),
//                   );
//                 },
//                 child: Column(
//                   children: [
//                     Container(
//                         margin: EdgeInsets.only(left: 100),
//                         child: const Text('Forgot Password?')),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(children: [
//                 Checkbox(
//                   value: isChecked,
//                   activeColor: Colors.black,
//                   onChanged: (bool? newValue) {
//                     setState(() {
//                       isChecked = newValue!;
//                     });
//                   },
//                 ),
//                 const Text(
//                   "Remember me",
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ]),
//               Center(
//                 child: CustomElevatedButton(
//                   onPressed: signIn,
//                   text: 'Sign In',
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Divider(
//                       color: Colors.grey,
//                       thickness: 1,
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8),
//                     child: Text(
//                       "Continue with",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Expanded(
//                     child: Divider(
//                       color: Colors.grey,
//                       thickness: 1,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 40),
//               Wrap(
//                 alignment: WrapAlignment.center,
//                 spacing: 15,
//                 runSpacing: 10,
//                 children: [
//                   CircleAvatar(
//                     radius: 25,
//                     backgroundColor: Colors.grey[200],
//                     child: Image.asset('assets/images/instagram.png'),
//                   ),
//                   CircleAvatar(
//                     radius: 25,
//                     backgroundColor: Colors.grey[200],
//                     child: Image.asset('assets/images/linkin.png'),
//                   ),
//                   CircleAvatar(
//                     radius: 25,
//                     backgroundColor: Colors.grey[200],
//                     child: Image.asset('assets/images/youtube.png'),
//                   ),
//                   CircleAvatar(
//                     radius: 25,
//                     backgroundColor: Colors.grey[200],
//                     child: Image.asset('assets/images/facebok.png'),
//                   ),
//                   CircleAvatar(
//                     radius: 25,
//                     backgroundColor: Colors.grey[200],
//                     child: Image.asset('assets/images/call.png'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 70),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     " Don't have an account? ",
//                     style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const SignUpScreen()),
//                       );
//                     },
//                     child: const Text(
//                       "Sign Up",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 14,
//                         color: AppColor.blueColor,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/app_color.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/loginscreen/forgotscreen.dart';
import 'package:investorentrepreneur/loginscreen/signup_screen.dart';
import 'package:investorentrepreneur/screen/home/homescreen.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
import 'package:investorentrepreneur/widget/custom_textformfield.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({super.key});

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isChecked = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // void signIn() async {
  //   String email = emailController.text.trim().toLowerCase();
  //   String password = passwordController.text.trim();

  //   if (email.isEmpty || password.isEmpty) {
  //     Fluttertoast.showToast(msg: "Please enter email and password");
  //     return;
  //   }

  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //       email: email, 
  //       password: password,
  //     );

  //     User? user = userCredential.user;

  //     if (user != null) {
  //       // Email verification check
  //       if (!user.emailVerified) {
  //         Fluttertoast.showToast(msg: "Please verify your email before login.");
  //         return;
  //       }

  //       Fluttertoast.showToast(msg: "Successful Login");
        
  //       // Navigate to HomeScreen
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const Homescreen()),
  //       );
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     print("Error: ${e.code}"); // Debugging log

  //     if (e.code == 'user-not-found') {
  //       Fluttertoast.showToast(msg: "No user found for that email.");
  //     } else if (e.code == 'wrong-password') {
  //       Fluttertoast.showToast(msg: "Wrong password provided.");
  //     } else {
  //       Fluttertoast.showToast(msg: "Login failed: ${e.message}");
  //     }
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: "An unexpected error occurred.");
  //   }
  // }
void signIn() async {
  String email = emailController.text.trim().toLowerCase();
  String password = passwordController.text.trim();

  if (email.isEmpty || password.isEmpty) {
    Fluttertoast.showToast(msg: "Please enter email and password");
    return;
  }

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email, 
      password: password,
    );

    User? user = userCredential.user;

    if (user != null) {
      Fluttertoast.showToast(msg: "Successful Login");

      // Navigate to HomeScreen
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Homescreen()),
        );
      }
    }
  } on FirebaseAuthException catch (e) {
    print("Error: ${e.code}"); // Debugging log

    if (e.code == 'user-not-found') {
      Fluttertoast.showToast(msg: "No user found for that email.");
    } else if (e.code == 'wrong-password') {
      Fluttertoast.showToast(msg: "Wrong password provided.");
    } else {
      Fluttertoast.showToast(msg: "Login failed: ${e.message}");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: "An unexpected error occurred.");
  }
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
                  text: "Welcome back 👋!",
                  fontSize: 28,
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
                obscureText: true,
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Forgotscreen(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 100),
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: Colors.black,
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
                ],
              ),
              Center(
                child: CustomElevatedButton(
                  onPressed: signIn,
                  text: 'Sign In',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Continue with",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Expanded(child: Divider(color: Colors.grey, thickness: 1)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    " Don't have an account? ",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: const Text(
                      "Sign Up",
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
