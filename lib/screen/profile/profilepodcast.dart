import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/home/map/videos.dart';
import 'package:investorentrepreneur/widget/videoplayer.widget.dart';

class Profilepodcast extends StatefulWidget {
  const Profilepodcast({super.key});

  @override
  State<Profilepodcast> createState() => _ProfilepodcastState();
}

class _ProfilepodcastState extends State<Profilepodcast> {
  final List<Map<String, String>> _videos = [
    {
      'path': 'assets/videos/video1.mp4',
      'category': 'Networking',
      'name': 'Lilly Williams'
    },
    {
      'path': 'assets/videos/video2.mp4',
      'category': 'Finance',
      'name': 'Lilly Williams'
    },
    {
      'path': 'assets/videos/video3.mp4',
      'category': 'Exploring cinematic',
      'name': 'Lilly Williams'
    },
    {
      'path': 'assets/videos/video4.mp4',
      'category': 'Exploring cinematic',
      'name': 'Lilly Williams'
    },
    {
      'path': 'assets/videos/video5.mp4',
      'category': 'Technology',
      'name': 'Lilly Williams'
    },
    {
      'path': 'assets/videos/video6.mp4',
      'category': 'Education',
      'name': 'Lilly Williams'
    },
  ];

  final List<String> _Videos =
      List.generate(20, (index) => 'assets/videos/video$index.mp4');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: _buildVideoGrid(_videos, context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoGrid(
      List<Map<String, String>> videos, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 600 ? 3 : 2;
    final childAspectRatio = screenWidth > 600 ? 0.8 : 0.67;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: childAspectRatio,
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
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: VideoPlayerWidget(
                      videoPath: video['path']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(
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
                          Text(
                            video['name']!,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
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
    );
  }
}
