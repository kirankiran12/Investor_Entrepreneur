
// import 'package:flutter/material.dart';
// import 'package:investorentrepreneur/common/customtext.dart';
// import 'package:investorentrepreneur/screen/event/participant.dart';
// import 'package:investorentrepreneur/widget/custom_elevated_button.dart';

// class Ticket extends StatefulWidget {
//   const Ticket({super.key});

//   @override
//   _TicketState createState() => _TicketState();
// }

// class _TicketState extends State<Ticket> {
//   @override
//   Widget build(BuildContext context) {
   
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return SingleChildScrollView(
//             padding: EdgeInsets.symmetric(
//                 horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 40,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.arrow_back_ios,
//                           size: screenWidth * 0.07, color: Colors.black),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                     CustomText(
//                       text: "Ticket Detail",
//                       fontSize: screenWidth * 0.06,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     IconButton(onPressed: (){}, icon: Icon(Icons.share))
//                   ],
//                 ),
//                 SizedBox(height: screenHeight * 0.02),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(screenWidth * 0.03),
//                   child: Image.asset(
//                     'assets/images/ticketdetail.jpeg',
//                     width: screenWidth * 0.9,
//                     height: screenWidth * 0.5,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               SizedBox(height: 20,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         'Risk tolerant for higher return',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize:22,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
                   
//                   ],
//                 ),
//                 SizedBox(height: 20,),
//                 Divider(),
//                   SizedBox(height: 20,),
//                   Column(
//                     children: [
//                        const Align(
//                     alignment: Alignment.centerLeft,
//                       child: Text('Location',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                       
                           
//                    ) ],
//                   ),
//                SizedBox(height: 10,),
//                   Text('ST.James Park Square,London',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
//                     SizedBox(height: 10,),
            
//                 SizedBox(height: screenHeight * 0.01),
//                 Column(
//                   children: [


//                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                      Text('Name',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),


//                     SizedBox(width: screenWidth * 0.02),
//                     Expanded(
//                       child: Text(
//                         'Date',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: screenWidth * 0.035,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                          Text('Kim Seon ho',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    
                    
//                         SizedBox(width: screenWidth * 0.02),
//                         Expanded(
//                           child: Text(
//                             '23 April 2025',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: screenWidth * 0.035,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                   Column(
//                   children: [


//                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                      Text('Start time',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),


//                     SizedBox(width: screenWidth * 0.02),
//                     Expanded(
//                       child: Text(
//                         'End time',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: screenWidth * 0.035,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                          Text('18.00pm',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    
                    
//                         SizedBox(width: screenWidth * 0.02),
//                         Expanded(
//                           child: Text(
//                             '22.00pm',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: screenWidth * 0.035,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
// ClipRRect(
//                   borderRadius: BorderRadius.circular(screenWidth * 0.03),
//                   child: Image.asset(
//                     'assets/images/barCode.png',
//                     width: screenWidth * 0.9,
//                     height: screenWidth * 0.5,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                   ],
//                 ),
//                 Divider(),
              
              
//                 Center(
//                   child: CustomElevatedButton(
//                     onPressed: () {
//                         Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const Participant()),
//                       );
//                     },
//                     text: 'Buy Ticket',
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

  
// }
import 'package:flutter/material.dart';

class InwardDividerContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          width: screenWidth * 0.9,
          child: Stack(
            children: [
              // Background with inward curve
              ClipPath(
                clipper: InwardCurveClipper(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 200,
                ),
              ),
              // Content on top of the background
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Above the Divider",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "Below the Divider",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Clipper for the inward curve
class InwardCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double curveDepth = 20; // Depth of the inward curve

    // Draw the rectangle with inward curve in the middle
    path.moveTo(0, 0); // Top-left
    path.lineTo(0, size.height * 0.5 - curveDepth); // Left to start of curve
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.5 + curveDepth,
      size.width,
      size.height * 0.5 - curveDepth,
    ); // Curve in the middle
    path.lineTo(size.width, 0); // Top-right
    path.lineTo(size.width, size.height); // Bottom-right
    path.lineTo(0, size.height); // Bottom-left
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
