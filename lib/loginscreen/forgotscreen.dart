
// import 'package:flutter/material.dart';
// import 'package:investorentrepreneur/loginscreen/authcontrol.dart';
// import 'package:investorentrepreneur/loginscreen/utils.dart';
// import 'package:investorentrepreneur/widget/custom_textformfield.dart';
// import 'package:lottie/lottie.dart';

// import 'package:provider/provider.dart';

// class Forgetscreen extends StatefulWidget {
//   const Forgetscreen({super.key});

//   @override
//   State<Forgetscreen> createState() => _ForgetscreenState();
// }

// class _ForgetscreenState extends State<Forgetscreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
// bool  isLoading =true;
//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Container(color:  const Color.fromARGB(255, 15, 3, 241).withOpacity(0.4),
//                     height: 250,
//                     width: 470,
//                                  child: Align(alignment: Alignment.centerLeft,
//                                    child: Lottie.asset(
//                                                                'assets/animations/animation.json', 
//                                                                width: 100,
//                                                                height: 200,
//                                                                fit: BoxFit.cover,
//                                                              ),
//                                  ),
                  
//                   ),
//                 ),
//                  const Text('Email',
//                       style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black)),
//                           SizedBox(height: 30,),
//                 CustomTextFormField(
//                   controller: _emailController,
//               hint:  'Email',
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
//                         .hasMatch(value)) {
//                       return 'Please enter a valid email address';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 50),
//                 Consumer<AuthController>(
//                   builder: (context, controller, child) {

//                   return ElevatedButton(

//                     style: ElevatedButton.styleFrom(
//                      backgroundColor: const Color.fromARGB(255, 15, 3, 241)
//                             .withOpacity(0.4),
//                        ),
                  
                    
//                     onPressed: () async{
//                       if (_formKey.currentState!.validate()){
//                         String email = _emailController.text;
//                         String response = await controller.sendPasswordResetEmail(email);

//                         if (response == 'Password reset email sent successfully') {
//                           Navigator.pop(context);
//                           _emailController.clear();
//                           Utilis.toastSuccessMessage('Check your email for the password reset link. Click on the link to set a new password');
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text(response)),
//                           );
//                         }
                        
//                       }
//                     },
//                     child: controller.isLoading
//                         ? const CircularProgressIndicator(
//                       color: Colors.white,
//                       strokeWidth: 2.0,
//                     )
//                         :  const Text(
//                       'Reset Password ',
//                       style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold
//                       ),
//                     ),
//                   );
//                 },)
//               ],
//             ),
//           ),
//         ),
//      ),
// );
// }
// }
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/loginscreen/authcontrol.dart';
import 'package:investorentrepreneur/loginscreen/utils.dart';
import 'package:investorentrepreneur/widget/custom_textformfield.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Forgetscreen extends StatefulWidget {
  const Forgetscreen({super.key});

  @override
  State<Forgetscreen> createState() => _ForgetscreenState();
}

class _ForgetscreenState extends State<Forgetscreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Responsive Screen Width & Height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ✅ Top Animated Container with Rounded Bottom
            ClipPath(
              clipper: BottomCurvedClipper(),
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.35, // Adjust height dynamically
                color: const Color.fromARGB(255, 15, 3, 241).withOpacity(0.4),
                child: Align(alignment: Alignment.centerLeft,
                  child: Lottie.asset(
                    'assets/animations/animation.json',
                    width: screenWidth * 0.03, // Adjust animation size
                    height: screenHeight * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.07, // Responsive padding
                vertical: screenHeight * 0.03,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      controller: _emailController,
                      hint: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: Consumer<AuthController>(
                        builder: (context, controller, child) {
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                backgroundColor:
                                    const Color.fromARGB(255, 15, 3, 241)
                                        .withOpacity(0.4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  String email = _emailController.text;
                                  String response =
                                      await controller.sendPasswordResetEmail(email);

                                  if (response == 'Password reset email sent successfully') {
                                    Navigator.pop(context);
                                    _emailController.clear();
                                    Utilis.toastSuccessMessage(
                                      'Check your email for the password reset link. Click on the link to set a new password.',
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(response)),
                                    );
                                  }
                                }
                              },
                              child: controller.isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.0,
                                    )
                                  : const Text(
                                      'Reset Password',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ ClipPath Custom Clipper for Rounded Bottom
class BottomCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height + 50, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
