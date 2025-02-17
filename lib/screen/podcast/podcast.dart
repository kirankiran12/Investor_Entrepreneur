import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/home/map/videos.dart';
import 'package:investorentrepreneur/screen/home/mapscreen/map.dart';
import 'package:investorentrepreneur/screen/podcast/podcastcategory.dart';
import 'package:investorentrepreneur/widget/videoplayer.widget.dart';

class PodcastScreenContent extends StatefulWidget {
  const PodcastScreenContent({super.key});

  @override
  _PodcastScreenContentState createState() => _PodcastScreenContentState();
}

class _PodcastScreenContentState extends State<PodcastScreenContent> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, String>> _videos = [
    {
      'path': 'assets/videos/video1.mp4',
      'category': 'Business',
      'name': 'Lilly Williams'
    },
    {
      'path': 'assets/videos/video2.mp4',
      'category': 'Finance',
      'name': 'Lilly Williams'
    },
    {
      'path': 'assets/videos/video3.mp4',
      'category': 'Networking',
      'name': 'Lilly Williams'
    },
    {
      'path': 'assets/videos/video4.mp4',
      'category': 'Developer',
      'name': 'Lilly Williams'
    },
  ];
  final List<String> _Videos =
      List.generate(20, (index) => 'assets/videos/video$index.mp4');
  int _selectedTab = 0;
  final List<String> _tabs = ["All", "Category", "Location", "Date"];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<Map<String, String>> filteredVideos = _videos
        .where(
            (video) => video['category']!.toLowerCase().contains(_searchQuery))
        .toList();

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
            
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Podcast",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Mapscreen()),
                        );
                      },
                      icon: const Icon(Icons.location_on_rounded),
                    ),
                    const SizedBox(width: 10),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey[200],
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PodcastCategory()),
                          );
                        },
                        icon: Icon(
                          Icons.add,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value.toLowerCase();
                  });
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(_tabs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTab = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: _selectedTab == index
                            ? LinearGradient(colors: [
                                Colors.blue,
                                Colors.purple,
                                Colors.red,
                                Colors.orange
                              ])
                            : null,
                        color: _selectedTab == index ? null : Colors.grey[300],
                      ),
                      child: Row(
                        children: [
                          Text(
                            _tabs[index],
                            style: TextStyle(
                              color: _selectedTab == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          if (index != 0)
                            Icon(Icons.arrow_drop_down,
                                color: _selectedTab == index
                                    ? Colors.white
                                    : Colors.black),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            _buildSectionTitle("Recently Played"),
            _buildVideoList(filteredVideos, screenHeight),
            _buildSectionTitle("Recommended Videos"),
            _buildVideoList(filteredVideos, screenHeight),
            _buildSectionTitle("Suggested Podcasts"),
            _buildGridVideoList(filteredVideos, screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildVideoList(
      List<Map<String, String>> videos, double screenHeight) {
    return SizedBox(
      height: screenHeight * 0.25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReelsScreen(
                    videos: _Videos,
                    initialIndex: index,
                  ),
                ),
              );
            },
            child: Container(
              width: 160,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: VideoPlayerWidget(
                        videoPath: video['path']!,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: const Icon(
                          Icons.bookmark_border,
                          color: Colors.white,
                          size: 24,
                        ),
                        onPressed: () {
                          print("Bookmark tapped for video: ${video['path']}");
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      left: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              video['category']!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              video['name']!,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: const [
                                Icon(Icons.access_time,
                                    size: 14, color: Colors.white),
                                SizedBox(width: 4),
                                Text(
                                  "35 min ago",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                SizedBox(width: 25),
                                Icon(Icons.screen_share_outlined,
                                    size: 20, color: Colors.white),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGridVideoList(
      List<Map<String, String>> videos, double screenWidth) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(3),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: screenWidth > 900
            ? 5
            : screenWidth > 600
                ? 4
                : 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 0.8, 
      ),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReelsScreen(
                  videos: _Videos,
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
                  videoPath: video['path']!, fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}
