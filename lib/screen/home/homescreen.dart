import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/screen/event/eventHome.dart';
import 'package:investorentrepreneur/screen/home/create/createvideo/createvideo.dart';
import 'package:investorentrepreneur/screen/home/create/eventCreate/eventCreate.dart';
import 'package:investorentrepreneur/screen/home/create/jobcreate/createjob.dart';
import 'package:investorentrepreneur/screen/home/create/podcastcreate/podcastcreate.dart';
import 'package:investorentrepreneur/screen/home/filter/screen/filterscreen.dart';
import 'package:investorentrepreneur/screen/home/map/videos.dart';
import 'package:investorentrepreneur/screen/home/mapscreen/map.dart';
import 'package:investorentrepreneur/screen/jobs/screen/jobs_screen.dart';
import 'package:investorentrepreneur/screen/podcast/podcast.dart';
import 'package:investorentrepreneur/screen/profile/profilehome.dart';

import 'package:investorentrepreneur/widget/bottom%20_navigationbar.dart';
import 'package:investorentrepreneur/widget/videoplayer.widget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreenContent(),
    PodcastScreenContent(),
    EventScreenContent(),
    JobsScreen(),
    ProfileHome(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<String> _videos =
      List.generate(20, (index) => 'assets/videos/video$index.mp4');

  HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: 50,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "HeyAzita👋!",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 40,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Mapscreen()),
                    );
                    Icon(Icons.location_on_rounded);
                  },
                  icon: Icon(Icons.location_on_rounded),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[200],
                  child: IconButton(
                    onPressed: () {
                      _showBottomSheet(context);
                    },
                    icon: Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        _searchQuery = value.toLowerCase();
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search...',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  height: 50,
                  width: 80,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Filterscreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.last_page,
                      size: 24,
                      color: Colors.black,
                    ),
                    label: SizedBox.shrink(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              "Explore Videos",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(3),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenWidth > 600 ? 6 : 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 1,
              ),
              itemCount: _videos
                  .where((video) => video.toLowerCase().contains(_searchQuery))
                  .length,
              itemBuilder: (context, index) {
                final filteredVideos = _videos
                    .where(
                        (video) => video.toLowerCase().contains(_searchQuery))
                    .toList();
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReelsScreen(
                          videos: _videos,
                          initialIndex: index,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: VideoPlayerWidget(
                        videoPath: filteredVideos[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Text(
                'Create',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              ListTile(
                leading:
                    const Icon(Icons.videocam_outlined, color: Colors.black),
                title: const Text("Videos"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Createvideo()),
                  );
                },
              ),
              const Divider(),
              ListTile(
                leading:
                    const Icon(Icons.podcasts_outlined, color: Colors.black),
                title: const Text("Podcast"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Createpodcaste()),
                  );
                  },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.event, color: Colors.black),
                title: const Text("Event"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateEvent()),
                  );},
              ),
              const Divider(),
              ListTile(
                leading:
                    const Icon(Icons.find_in_page_sharp, color: Colors.black),
                title: const Text("jobs"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateJob()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
