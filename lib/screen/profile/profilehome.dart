// // // import 'package:flutter/material.dart';

// // // class Profilehome extends StatefulWidget {
// // //   const Profilehome({super.key});

// // //   @override
// // //   State<Profilehome> createState() => _ProfilehomeState();
// // // }

// // // class _ProfilehomeState extends State<Profilehome> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     double screenWidth = MediaQuery.of(context).size.width;
// // //     double screenHeight = MediaQuery.of(context).size.height;
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         centerTitle: true,
// // //         // title: Text('appbar'),
// // //         backgroundColor: Colors.white,
// // //         elevation: 5,
// // //         leading: Builder(builder: (context) {
// // //           return IconButton(
// // //             icon: Icon(Icons.menu),
// // //             onPressed: () {
// // //               Scaffold.of(context).openDrawer();
// // //             },
// // //           );
// // //         }),
// // //         actions: [
// // //           IconButton(
// // //               onPressed: () {},
// // //               icon: Icon(
// // //                 Icons.notifications,
// // //                 size: 25,
// // //                 color: Colors.black,
// // //               )),
// // //           IconButton(
// // //               onPressed: () {},
// // //               icon: Icon(
// // //                 Icons.offline_bolt_outlined,
// // //                 size: 25,
// // //                 color: Colors.black,
// // //               )),
// // //         ],
// // //       ),
// // //       drawer: Drawer(
// // //         child: ListView(
// // //           children: [
// // //             DrawerHeader(
// // //               decoration: BoxDecoration(color: Colors.blue),
// // //               child: Center(
// // //                 child: Text(
// // //                   'Drawer Header',
// // //                   style: TextStyle(color: Colors.white, fontSize: 20),
// // //                 ),
// // //               ),
// // //             ),
// // //             ListTile(
// // //               leading: CircleAvatar(
// // //                 child: Icon(Icons.home),
// // //               ),
// // //               title: Text('school'),
// // //               trailing: Icon(Icons.calculate),
// // //               onTap: () {
// // //                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// // //                   content: Text('home is clicked'),
// // //                 ));
// // //               },
// // //             ),
// // //             ListTile(
// // //               leading: CircleAvatar(
// // //                 child: Icon(Icons.home),
// // //               ),
// // //               title: Text('home'),
// // //               trailing: Icon(Icons.home),
// // //               onTap: () {
// // //                 ScaffoldMessenger.of(context)
// // //                     .showSnackBar(SnackBar(content: Text('home is clicked')));
// // //               },
// // //             )
// // //           ],
// // //         ),
// // //       ),
// // //       body: Column(children: [
// // //         Row(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Container(
// // //               height: screenHeight * 0.15,
// // //               width: screenWidth * 0.4,
// // //               decoration: BoxDecoration(
// // //                 borderRadius: BorderRadius.circular(12),
// // //               ),
// // //               child: CircleAvatar(
// // //                 radius: 25,
// // //                 backgroundImage: AssetImage('assets/images/profile.jpeg'),
// // //               ),
// // //             ),
// // //             SizedBox(width: screenWidth * 0.05),
// // //             Flexible(
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   SizedBox(
// // //                     height: 10,
// // //                   ),
// // //                   Text(
// // //                     "Profile reviews",
// // //                     style: TextStyle(
// // //                       color: Colors.black,
// // //                       fontSize: screenWidth * 0.045,
// // //                       fontWeight: FontWeight.bold,
// // //                     ),
// // //                   ),
// // //                   SizedBox(height: screenHeight * 0.015),
// // //                   Row(
// // //                     children: [
// // //                       Icon(
// // //                         Icons.star,
// // //                         size: 20,
// // //                         color: Colors.amber,
// // //                       ),
// // //                       Icon(
// // //                         Icons.star,
// // //                         size: 20,
// // //                         color: Colors.amber,
// // //                       ),
// // //                       Icon(
// // //                         Icons.star,
// // //                         size: 20,
// // //                         color: Colors.amber,
// // //                       ),
// // //                       Icon(
// // //                         Icons.star,
// // //                         size: 20,
// // //                         color: Colors.amber,
// // //                       ),
// // //                       Icon(
// // //                         Icons.star,
// // //                         size: 20,
// // //                         color: Colors.amber,
// // //                       ),
// // //                       Text("4.7out of 5",
// // //                           style: TextStyle(
// // //                               fontSize: 15,
// // //                               color: Colors.black,
// // //                               fontWeight: FontWeight.bold)),
// // //                     ],
// // //                   ),
// // //                   SizedBox(
// // //                     height: 10,
// // //                   ),
// // //                   Row(
// // //                     children: [
// // //                       SizedBox(width: screenWidth * 0.02),
// // //                       Text(
// // //                         '1,478 global rating',
// // //                         style: TextStyle(
// // //                           fontSize: screenWidth * 0.035,
// // //                           fontWeight: FontWeight.normal,
// // //                           color: Colors.black,
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   SizedBox(height: screenHeight * 0.01),
// // //                   Row(
// // //                     children: [
// // //                       TextButton(
// // //                         onPressed: () {
// // //                           // Navigator.push(
// // //                           //   context,
// // //                           //   MaterialPageRoute(
// // //                           //       builder: (context) =>
// // //                           //           const CreaterViews()),
// // //                           // );
// // //                         },
// // //                         child: const Text(
// // //                           "view personal info",
// // //                           style: TextStyle(
// // //                             fontWeight: FontWeight.bold,
// // //                             fontSize: 15,
// // //                             color: Colors.blue,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                       Icon(Icons.chevron_right_sharp, size: 20, color: Colors.blue),
// // //                       SizedBox(width: screenWidth * 0.02),
// // //                     ],
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //         Row(
// // //           children: [
// // //             ElevatedButton(
// // //               style: ElevatedButton.styleFrom(backgroundColor:   const Color.fromARGB(255, 206, 218, 240),),
// // //               onPressed: () {},
// // //               child: Text('Edit profile',
// // //                   style: TextStyle(
// // //                     fontWeight: FontWeight.bold,
// // //                     fontSize: 15,
// // //                     color: Colors.black,
// // //                   )
// // //                   ),
// // //             ),
// // //             ElevatedButton(
// // //               style: ElevatedButton.styleFrom(backgroundColor:   const Color.fromARGB(255, 206, 218, 240),),
// // //                 onPressed: () {},
// // //                 child: Text(
// // //                   'Saved',style: TextStyle(
// // //                     fontWeight: FontWeight.bold,
// // //                     fontSize: 15,
// // //                     color: Colors.black,
// // //                   )
// // //                 )),
// // //           ],
// // //         ),
// // //       ]),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';

// // class Profilehome extends StatefulWidget {
// //   const Profilehome({super.key});

// //   @override
// //   State<Profilehome> createState() => _ProfilehomeState();
// // }

// // class _ProfilehomeState extends State<Profilehome> {
// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;
// //     double screenHeight = MediaQuery.of(context).size.height;

// //     return Scaffold(
// //       appBar: AppBar(
// //         centerTitle: true,
// //         backgroundColor: Colors.white,
// //         elevation: 5,
// //         leading: Builder(builder: (context) {
// //           return IconButton(
// //             icon: const Icon(Icons.menu),
// //             onPressed: () {
// //               Scaffold.of(context).openDrawer();
// //             },
// //           );
// //         }),
// //         actions: [
// //           IconButton(
// //             onPressed: () {},
// //             icon: const Icon(
// //               Icons.notifications,
// //               size: 25,
// //               color: Colors.black,
// //             ),
// //           ),
// //           IconButton(
// //             onPressed: () {},
// //             icon: const Icon(
// //               Icons.offline_bolt_outlined,
// //               size: 25,
// //               color: Colors.black,
// //             ),
// //           ),
// //         ],
// //       ),
// //       drawer: Drawer(
// //         child: ListView(
// //           children: [
// //             const DrawerHeader(
// //               decoration: BoxDecoration(color: Colors.blue),
// //               child: Center(
// //                 child: Text(
// //                   'Drawer Header',
// //                   style: TextStyle(color: Colors.white, fontSize: 20),
// //                 ),
// //               ),
// //             ),
// //             ListTile(
// //               leading: const CircleAvatar(
// //                 child: Icon(Icons.school),
// //               ),
// //               title: const Text('School'),
// //               trailing: const Icon(Icons.calculate),
// //               onTap: () {
// //                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// //                   content: Text('School is clicked'),
// //                 ));
// //               },
// //             ),
// //             ListTile(
// //               leading: const CircleAvatar(
// //                 child: Icon(Icons.home),
// //               ),
// //               title: const Text('Home'),
// //               trailing: const Icon(Icons.home),
// //               onTap: () {
// //                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// //                   content: Text('Home is clicked'),
// //                 ));
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //       body: Padding(
// //         padding: EdgeInsets.all(screenWidth * 0.05),
// //         child: Column(
// //           children: [
// //             Row(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Container(
// //                   height: screenHeight * 0.15,
// //                   width: screenWidth * 0.3,
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                   child: const CircleAvatar(
// //                     radius: 25,
// //                     backgroundImage: AssetImage('assets/images/profile.jpeg'),
// //                   ),
// //                 ),
// //                 SizedBox(width: screenWidth * 0.05),
// //                 Flexible(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       const SizedBox(height: 10),
// //                       Text(
// //                         "Profile Reviews",
// //                         style: TextStyle(
// //                           color: Colors.black,
// //                           fontSize: screenWidth * 0.045,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       SizedBox(height: screenHeight * 0.015),
// //                       Row(
// //                         children: const [
// //                           Icon(Icons.star, size: 20, color: Colors.amber),
// //                           Icon(Icons.star, size: 20, color: Colors.amber),
// //                           Icon(Icons.star, size: 20, color: Colors.amber),
// //                           Icon(Icons.star, size: 20, color: Colors.amber),
// //                           Icon(Icons.star, size: 20, color: Colors.amber),
// //                           Text(
// //                             " 4.7 out of 5",
// //                             style: TextStyle(
// //                                 fontSize: 15,
// //                                 color: Colors.black,
// //                                 fontWeight: FontWeight.bold),
// //                           ),
// //                         ],
// //                       ),
// //                       SizedBox(height: screenHeight * 0.01),
// //                       Text(
// //                         '1,478 global ratings',
// //                         style: TextStyle(
// //                           fontSize: screenWidth * 0.035,
// //                           fontWeight: FontWeight.normal,
// //                           color: Colors.black,
// //                         ),
// //                       ),
// //                       SizedBox(height: screenHeight * 0.01),
// //                       Row(
// //                         children: [
// //                           TextButton(
// //                             onPressed: () {},
// //                             child: const Text(
// //                               "View Personal Info",
// //                               style: TextStyle(
// //                                 fontWeight: FontWeight.bold,
// //                                 fontSize: 15,
// //                                 color: Colors.blue,
// //                               ),
// //                             ),
// //                           ),
// //                           const Icon(Icons.chevron_right_sharp,
// //                               size: 20, color: Colors.blue),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: screenHeight * 0.03),
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: ElevatedButton(
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor:
// //                           const Color.fromARGB(255, 206, 218, 240),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(50),
// //                       ),
// //                     ),
// //                     onPressed: () {},
// //                     child: const Text(
// //                       'Edit Profile',
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 15,
// //                         color: Colors.black,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(width: screenWidth * 0.03),
// //                 Expanded(
// //                   child: ElevatedButton(
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor:
// //                           const Color.fromARGB(255, 206, 218, 240),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(50),
// //                       ),
// //                     ),
// //                     onPressed: () {},
// //                     child: const Text(
// //                       'Saved',
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 15,
// //                         color: Colors.black,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class Profilehome extends StatefulWidget {
//   const Profilehome({super.key});

//   @override
//   State<Profilehome> createState() => _ProfilehomeState();
// }

// class _ProfilehomeState extends State<Profilehome> {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 5,
//         leading: Builder(builder: (context) {
//           return IconButton(
//             icon: const Icon(Icons.menu),
//             onPressed: () {
//               Scaffold.of(context).openDrawer();
//             },
//           );
//         }),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.notifications,
//               size: 25,
//               color: Colors.black,
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.offline_bolt_outlined,
//               size: 25,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(color: Colors.blue),
//               child: Center(
//                 child: Text(
//                   'Drawer Header',
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: const CircleAvatar(
//                 child: Icon(Icons.school),
//               ),
//               title: const Text('School'),
//               trailing: const Icon(Icons.calculate),
//               onTap: () {
//                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                   content: Text('School is clicked'),
//                 ));
//               },
//             ),
//             ListTile(
//               leading: const CircleAvatar(
//                 child: Icon(Icons.home),
//               ),
//               title: const Text('Home'),
//               trailing: const Icon(Icons.home),
//               onTap: () {
//                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                   content: Text('Home is clicked'),
//                 ));
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.05),
//         child: Column(
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: screenHeight * 0.15,
//                   width: screenWidth * 0.3,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const CircleAvatar(
//                     radius: 25,
//                     backgroundImage: AssetImage('assets/images/profile.jpeg'),
//                   ),
//                 ),
//                 SizedBox(width: screenWidth * 0.05),
//                 Flexible(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 10),
//                       Text(
//                         "Profile Reviews",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: screenWidth * 0.045,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: screenHeight * 0.015),
//                       Row(
//                         children: const [
//                           Icon(Icons.star, size: 20, color: Colors.amber),
//                           Icon(Icons.star, size: 20, color: Colors.amber),
//                           Icon(Icons.star, size: 20, color: Colors.amber),
//                           Icon(Icons.star, size: 20, color: Colors.amber),
//                           Icon(Icons.star, size: 20, color: Colors.amber),
//                           Text(
//                             " 4.7 out of 5",
//                             style: TextStyle(
//                                 fontSize: 15,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: screenHeight * 0.01),
//                       Text(
//                         '1,478 global ratings',
//                         style: TextStyle(
//                           fontSize: screenWidth * 0.035,
//                           fontWeight: FontWeight.normal,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: screenHeight * 0.01),
//                       Row(
//                         children: [
//                           TextButton(
//                             onPressed: () {},
//                             child: const Text(
                              
//                             "View Personal Info",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15,
//                                 color: Colors.blue,
//                               ),
//                             ),
//                           ),
//                           const Icon(Icons.chevron_right_sharp,
//                               size: 20, color: Colors.blue),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: screenHeight * 0.03),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor:
//                           const Color.fromARGB(255, 206, 218, 240),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                     ),
//                     onPressed: () {},
//                     child: const Text(
//                       'Edit Profile',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: screenWidth * 0.03),
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor:
//                           const Color.fromARGB(255, 206, 218, 240),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                     ),
//                     onPressed: () {},
//                     child: const Text(
//                       'Saved',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/profile/profileinfo.dart';

class ProfileHome extends StatefulWidget {
  const ProfileHome({super.key});

  @override
  State<ProfileHome> createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 5,
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 25,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.offline_bolt_outlined,
                size: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.school),
                ),
                title: const Text('School'),
                trailing: const Icon(Icons.calculate),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('School is clicked'),
                  ));
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.home),
                ),
                title: const Text('Home'),
                trailing: const Icon(Icons.home),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Home is clicked'),
                  ));
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            // Profile content
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: screenHeight * 0.15,
                          width: screenWidth * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage('assets/images/profile.jpeg'),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.05),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                "Profile Reviews",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.015),
                              Row(
                                children: const [
                                  Icon(Icons.star,
                                      size: 20, color: Colors.amber),
                                  Icon(Icons.star,
                                      size: 20, color: Colors.amber),
                                  Icon(Icons.star,
                                      size: 20, color: Colors.amber),
                                  Icon(Icons.star,
                                      size: 20, color: Colors.amber),
                                  Icon(Icons.star,
                                      size: 20, color: Colors.amber),
                                  Text(
                                    " 4.7 out of 5",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Text(
                                '1,478 global ratings',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
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
                                      "View Personal Info",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  const Icon(Icons.chevron_right_sharp,
                                      size: 20, color: Colors.blue),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 206, 218, 240),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 206, 218, 240),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Saved',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Tab bar with views
            const TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(icon: Icon(Icons.video_library), text: "Video"),
                Tab(icon: Icon(Icons.podcasts), text: "Podcast"),
                Tab(icon: Icon(Icons.event), text: "Event"),
                Tab(icon: Icon(Icons.work), text: "Job"),
                Tab(icon: Icon(Icons.person), text: "Profile"),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: screenHeight * 0.4,
          child: const TabBarView(
            children: [
              Center(child: Text("Video Content")),
              Center(child: Text("Podcast Content")),
              Center(child: Text("Event Content")),
              Center(child: Text("Job Content")),
              Center(child: Text("Profile Content")),
            ],
          ),
        ),
      ),
    );
  }
}
