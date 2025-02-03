import 'package:flutter/material.dart';
import 'package:investorentrepreneur/home/map/videos.dart';
import 'package:investorentrepreneur/widget/videoplayer.widget.dart';

class PodcastCategory extends StatefulWidget {
  const PodcastCategory({super.key});

  @override
  _PodcastCategoryState createState() => _PodcastCategoryState();
}

class _PodcastCategoryState extends State<PodcastCategory> {
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
    double paddingHorizontal = screenWidth * 0.05;
    double paddingVertical = screenHeight * 0.05;

    int gridCrossAxisCount = screenWidth > 600 ? 3 : 2;

    return Container(
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
                          size: 30, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 8),
                   const  Text("Podcast",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    SizedBox(width: 50),
                    IconButton(
                      icon: Icon(Icons.bookmark_border,
                          size: 30, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('  Finance',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                            SizedBox(height: 10,),
                    Text('  75min',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                              SizedBox(height: 10,),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.info)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.screen_share_outlined)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.star_border_outlined)),
                        Text('4.5(571)',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
              SizedBox(height: 20),
            Column(
              children: [
              const   Text(
                  '''Lorem is a simply dummy text of the printing and typewriting industry.lorem lpsum has been the industry's standard dummy text over the 1500s. It may type of spacemen book''',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _buildPersonButton('Host', screenWidth),
                SizedBox(width: 10),
                _buildPersonButton('Guest', screenWidth),
                SizedBox(width: 10),
                _buildPersonButton('Guest', screenWidth),
              ],
            ),
            _buildSectionTitle(
              "Similar Podcast",
            ),
            _buildGridVideoList(_videos, screenWidth, gridCrossAxisCount),
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

  Widget _buildPersonButton(String label, double screenWidth) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        children: [
          CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage('assets/images/podcast.jpeg')),
          SizedBox(width: 5),
          Text(label,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
      ),
    );
  }
}
