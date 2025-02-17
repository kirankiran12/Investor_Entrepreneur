import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/profile/profileinfo.dart';
import 'package:investorentrepreneur/screen/profile/profilejob.dart';
import 'package:investorentrepreneur/screen/profile/profilepodcast.dart';
import 'package:investorentrepreneur/screen/profile/profileprofile.dart';
import 'package:investorentrepreneur/screen/profile/profilevent.dart';
import 'package:investorentrepreneur/screen/profile/profilevideo.dart';
import 'package:investorentrepreneur/screen/saved.dart';

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
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
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
                    SizedBox(height: 5),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Saved()),
                              );
                            },
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
            const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.video_library),
                ),
                Tab(
                  icon: Icon(Icons.podcasts),
                ),
                Tab(
                  icon: Icon(Icons.event),
                ),
                Tab(
                  icon: Icon(Icons.work),
                ),
                Tab(
                  icon: Icon(Icons.person),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: screenHeight * 0.45,
          child: const TabBarView(
            children: [
              Profilevideo(),
              Profilepodcast(),
              Profilevent(),
              Profilejob(),
              Profileprofile(),
            ],
          ),
        ),
      ),
    );
  }
}
