import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/home/map/videos.dart';
import 'package:investorentrepreneur/widget/videoplayer.widget.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  SavedState createState() => SavedState();
}

class SavedState extends State<Saved> {
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios,
                    size: screenWidth * 0.07, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                "Saved",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(children: [
            const Text(
              "Videos",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _videos.length,
                itemBuilder: (context, index) {
                  final video = _videos[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReelsScreen(
                            videos: _videos.map((v) => v['path']!).toList(),
                            initialIndex: index,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            VideoPlayerWidget(
                              videoPath: video['path']!,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 8,
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
                                    Text(
                                      video['name']!,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
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
            )
          ]),
          const SizedBox(height: 20),
          const Text(
            "Podcasts",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildEventCard(
                    'assets/images/politics.jpeg', 'Tech', 'Feb 10, 2025'),
                _buildEventCard(
                    'assets/images/tech.jpeg', 'Politics', 'Mar 15, 2025'),
                _buildEventCard(
                    'assets/images/business.jpeg', 'Startup', 'Feb 10, 2025'),
                _buildEventCard('assets/images/technology.jpeg', 'Business',
                    'Mar 15, 2025'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(String imagePath, String category, String date) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.bookmark_outline,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.3),
                        ),
                        child: const Text(
                          'Buy Ticket',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.share, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
