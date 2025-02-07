import 'package:flutter/material.dart';

import 'package:investorentrepreneur/screen/profile/mysubcribers.dart';

class Profileprofile extends StatefulWidget {
  const Profileprofile({super.key});

  @override
  State<Profileprofile> createState() => _ProfileprofileState();
}

class _ProfileprofileState extends State<Profileprofile> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: [
                Tab(text: 'My subscribers'),
                Tab(
                  text: 'Subscribers',
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: screenHeight * 0.39,
          child: const TabBarView(
            children: [
              Mysubcribers(),
              Center(child: Text("Subscribed")),
            ],
          ),
        ),
      ),
    );
  }
}
