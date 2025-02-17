import 'package:flutter/material.dart';

import 'package:investorentrepreneur/screen/home/Setting/acessContact.dart';
import 'package:investorentrepreneur/screen/home/Setting/appliedjob.dart';
import 'package:investorentrepreneur/screen/home/Setting/blockuserscreen.dart';

import 'package:investorentrepreneur/screen/home/Setting/myevent.dart';
import 'package:investorentrepreneur/screen/home/Setting/paymentmethod/payment.dart';
import 'package:investorentrepreneur/screen/home/Setting/paymentmethod/startedverify.dart';
import 'package:investorentrepreneur/screen/home/Setting/privacypolicy/privacypolicy.dart';

import 'package:investorentrepreneur/screen/massage/massage.dart';
import 'package:investorentrepreneur/screen/massage/notification.dart';
import 'package:investorentrepreneur/screen/profile/profileinfo.dart';
import 'package:investorentrepreneur/screen/profile/profilejob.dart';
import 'package:investorentrepreneur/screen/profile/profilepodcast.dart';
import 'package:investorentrepreneur/screen/profile/profileprofile.dart';
import 'package:investorentrepreneur/screen/profile/profilevent.dart';
import 'package:investorentrepreneur/screen/profile/profilevideo.dart';
import 'package:investorentrepreneur/screen/profilescreenother/profilescreenother.dart';

import 'package:investorentrepreneur/screen/watchhistory.dart';

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Notificationscreen()),
                );
              },
              icon: const Icon(
                Icons.notifications,
                size: 25,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Massagescreen()),
                );
              },
              icon: const Icon(
                Icons.offline_bolt_outlined,
                size: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_back_ios_new),
                ),
                title: const Text(
                  'Setting',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.find_in_page_outlined),
                ),
                title: const Text('Applied  job'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Appliedjob()),
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.archive_outlined),
                ),
                title: const Text('Ticket bought'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Myevent()),
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.history),
                ),
                title: const Text('Watch history'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WatchHistory()));
                },
              ),
              Divider(),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.notifications),
                ),
                title: const Text('Notiification'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Notificationscreen()),
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.chat),
                ),
                title: const Text('Massage'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Massagescreen()),
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.contact_page),
                ),
                title: const Text('Access to your contact'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactPage()),
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.block_outlined),
                ),
                title: const Text('Block user list'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlockUserScreen()));
                },
              ),
              Divider(),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.perm_device_information),
                ),
                title: const Text('Device permission'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CustomScreen1()));
                },
              ),
              Divider(),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.card_membership),
                ),
                title: const Text('Cards'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Paymentscreen()));
                },
              ),
              Divider(),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.card_membership),
                ),
                title: const Text('privacy policy'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PrivacyPolicy()));
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Profilescreenother()),
                              );
                            },
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
                                    builder: (context) => const WatchHistory()),
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
