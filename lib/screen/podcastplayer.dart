import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/eventdetail2.dart';
import 'package:investorentrepreneur/screen/home/map/videos.dart';
import 'package:investorentrepreneur/widget/videoplayer.widget.dart';

class Podcastplayer extends StatefulWidget {
  const Podcastplayer({super.key});

  @override
  _PodcastplayerState createState() => _PodcastplayerState();
}

class _PodcastplayerState extends State<Podcastplayer> {
  final List<Map<String, String>> _videos = [
    {'path': 'assets/videos/video1.mp4', 'category': 'Business'},
    {'path': 'assets/videos/video2.mp4', 'category': 'Finance'},
    {'path': 'assets/videos/video3.mp4', 'category': 'Networking'},
    {'path': 'assets/videos/video4.mp4', 'category': 'Developer'},
  ];

  final List<String> _Videos =
      List.generate(20, (index) => 'assets/videos/video$index.mp4');

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double paddingHorizontal = screenWidth * 0.02;
    double paddingVertical = screenHeight * 0.05;

    int gridCrossAxisCount = screenWidth > 600 ? 3 : 2;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal, vertical: paddingVertical),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios,
                            size: screenWidth * 0.07, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 8),
                      Text("Podcast",
                          style: TextStyle(
                              fontSize: screenWidth * 0.06,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.bookmark_border,
                        size: screenWidth * 0.07, color: Colors.black),
                    onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Eventdetail2()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  Container(
                    height: screenHeight * 0.25,
                    width: screenWidth * 0.4,
                    child: ClipRRect(
                      child: Image.asset('assets/images/podcast.jpeg',
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Finance',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: screenHeight * 0.01),
                      Text('75min',
                          style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey)),
                      SizedBox(height: screenHeight * 0.01),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.play_circle_outline,
                            size: screenWidth * 0.06, color: Colors.black),
                        label: Text('Play again',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: screenWidth * 0.045)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04,
                              vertical: screenHeight * 0.015),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.info, size: screenWidth * 0.06)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.screen_share_outlined,
                                  size: screenWidth * 0.06)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.star_border_outlined,
                                  size: screenWidth * 0.06)),
                          Text('4.5(571)',
                              style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                '''Lorem is a simply dummy text of the printing and typewriting industry.lorem lpsum has been the industry's standard dummy text over the 1500s. It may type of spacemen book''',
                style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  _buildPersonButton('Host', screenWidth),
                  SizedBox(width: screenWidth * 0.02),
                  _buildPersonButton('Guest', screenWidth),
                  SizedBox(width: screenWidth * 0.02),
                  _buildPersonButton('Guest', screenWidth),
                ],
              ),
              _buildSectionTitle("More podcast from this Creator", screenWidth),
              _buildGridVideoList(_videos, screenWidth, gridCrossAxisCount),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
      child: Text(
        title,
        style: TextStyle(
            fontSize: screenWidth * 0.055, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPersonButton(String label, double screenWidth) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        children: [
          CircleAvatar(
              radius: screenWidth * 0.03,
              backgroundImage: AssetImage('assets/images/host.jpeg')),
          SizedBox(width: screenWidth * 0.02),
          Text(label,
              style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, vertical: screenWidth * 0.03),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }

  Widget _buildGridVideoList(List<Map<String, String>> videos,
      double screenWidth, int crossAxisCount) {
    return SizedBox(
      height: 280,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: screenWidth * 0.02,
          mainAxisSpacing: screenWidth * 0.02,
          childAspectRatio: (screenWidth / crossAxisCount) / 200,
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
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                             Text(
                             'lilly Wallisam',
                              style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                
                             
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                          Icons.play_arrow_outlined,
                                          color: Colors.grey),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                    Text(
                                      "35 min ago",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.03,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Icon(Icons.screen_share_outlined,
                                    size: screenWidth * 0.05,
                                    color: Colors.white),
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
}
