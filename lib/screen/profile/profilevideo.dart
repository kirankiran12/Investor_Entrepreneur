import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/home/map/videos.dart';
import 'package:investorentrepreneur/widget/videoplayer.widget.dart';

class Profilevideo extends StatefulWidget {
  const Profilevideo({super.key});

  @override
  State<Profilevideo> createState() => _ProfilevideoState();
}

class _ProfilevideoState extends State<Profilevideo> {
  final List<String> _videos =
      List.generate(20, (index) => 'assets/videos/video$index.mp4');

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(3),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth > 600 ? 6 : 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: _videos.length,
        itemBuilder: (context, index) {
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
                  videoPath: _videos[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
