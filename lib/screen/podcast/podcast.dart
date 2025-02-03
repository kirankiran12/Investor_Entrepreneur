
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/home/map/videos.dart';
import 'package:investorentrepreneur/home/mapscreen/map.dart';
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
    {'path': 'assets/videos/video1.mp4', 'category': 'Business',},
    {'path': 'assets/videos/video2.mp4', 'category': 'Finance'},
    {'path': 'assets/videos/video3.mp4', 'category': 'Networking'},
    {'path': 'assets/videos/video4.mp4', 'category': 'Developer'},
  ];
 final List<String> _Videos =
      List.generate(20, (index) => 'assets/videos/video$index.mp4');
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    // Filter videos based on search
    List<Map<String, String>> filteredVideos = _videos
        .where((video) => video['category']!.toLowerCase().contains(_searchQuery))
        .toList();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
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
                        MaterialPageRoute(builder: (context) => const Mapscreen()),
                      );
                    },
                    icon: const Icon(Icons.location_on_rounded),
                  ),
                  const SizedBox(width: 10),
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 20),

          // Search Bar
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

          const SizedBox(height: 40),
          
          // Recently Played Section
          _buildSectionTitle("Recently Played"),
          _buildVideoList(filteredVideos),

          _buildSectionTitle("Recommended Videos"),
          _buildVideoList(filteredVideos),
          
          _buildSectionTitle("Suggested Podcasts"),
          _buildGridVideoList(filteredVideos, screenWidth),
        ],
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

  Widget _buildVideoList(List<Map<String, String>> videos) {
    return SizedBox(
      height: 180,
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
                     margin: EdgeInsets.only(right: 15),
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
                            bottom: 1,
                            left: 8,
                            right: 8,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    video['category']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time, size: 14, color: Colors.white),
                                      SizedBox(width: 4),
                                      Text(
                                        "35 min ago",
                                        style: TextStyle(fontSize: 12, color: Colors.white),
                                      ),
                                      SizedBox(width: 25,),
                                       Icon(Icons.screen_share_outlined, size: 20, color: Colors.white),
                                    ],
                                  ),
                                  
                                 
                                ],
                              ),
                            ),
                          ),
                        ],
                    )),),);
        
        },
      ),
    );
  }

  Widget _buildGridVideoList(List<Map<String, String>> videos, double screenWidth) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(3),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: screenWidth > 900 ? 5 : screenWidth > 600 ? 4 : 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 1,
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
              child: VideoPlayerWidget(videoPath: video['path']!, fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}
