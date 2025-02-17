
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/podcastplayer.dart';
import 'package:investorentrepreneur/widget/videoplayer.widget.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  int _selectedTab = 0;
  final List<String> _tabs = ["All", "Videos", "Podcasts", "Events"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildHeader(context),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
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

              
              Expanded(
                child: _buildTabContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  Widget _buildTabContent() {
    switch (_selectedTab) {
      case 1: 
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Videos'),
            const SizedBox(height: 10),
            _buildHorizontalList(_buildVideoCard),
          ],
        );
      case 2: 
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Podcasts'),
            const SizedBox(height: 10),
            _buildHorizontalList(_buildPodcastCard),
          ],
        );
      case 3: 
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Events'),
            const SizedBox(height: 10),
            _buildHorizontalList(_buildEventCard),
          ],
        );
      default: 
        return ListView(
          children: [
            _buildSectionTitle('Videos'),
            const SizedBox(height: 10),
            _buildHorizontalList(_buildVideoCard),
            const SizedBox(height: 20),
            _buildSectionTitle('Podcasts'),
            const SizedBox(height: 10),
            _buildHorizontalList(_buildPodcastCard),
            const SizedBox(height: 20),
            _buildSectionTitle('Events'),
            const SizedBox(height: 10),
            _buildHorizontalList(_buildEventCard),
          ],
        );
    }
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        const Text(
          "Saved",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildHorizontalList(Widget Function(int) itemBuilder) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: itemBuilder(index),
        ),
      ),
    );
  }

  Widget _buildVideoCard(int index) {
    final videos = [
      {'path': 'assets/videos/video1.mp4'},
      {'path': 'assets/videos/video2.mp4'},
      {'path': 'assets/videos/video3.mp4'},
      {'path': 'assets/videos/video4.mp4'},
      {'path': 'assets/videos/video5.mp4'},
      {'path': 'assets/videos/video6.mp4'},
    ];

    final video = videos[index];

    return GestureDetector(
      onTap: () {},
      child: Container(
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPodcastCard(int index) {
    final events = [
      {
        'image': 'assets/images/politicsimage.jpeg',
        'category': 'Politics',
        'name': 'Lily Waliasms',
        'time': '35 min ago'
      },
      {
        'image': 'assets/images/techmages.jpeg',
        'category': 'Tech',
        'name': 'Lily Waliasms',
        'time': '35 min ago'
      },
      {
        'image': 'assets/images/business.jpeg',
        'category': 'Startup',
        'name': 'Lily Waliasms',
        'time': '35 min ago'
      },
      {
        'image': 'assets/images/technology.jpeg',
        'category': 'Business',
        'name': 'Lily Waliasms',
        'time': '35 min ago'
      },
    ];

    final event = events[index % events.length];

    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(event['image']!),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(onPressed: (){
               Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Podcastplayer()),
                      );
            }, icon: const Icon(Icons.bookmark_outline,color: Colors.white,)),
           
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
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
                    event['category']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    event['name']!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.play_arrow_outlined,
                            color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        event['time']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
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

  Widget _buildEventCard(int index) {
    final events = [
      {'image': 'assets/images/technology.jpeg', 'category': 'Business', 'date': 'Mar 15, 2025'},
      {'image': 'assets/images/business.jpeg', 'category': 'Startup', 'date': 'Feb 10, 2025'},
      {'image': 'assets/images/tech.jpeg', 'category': 'Tech', 'date': 'Feb 10, 2025'},
      {'image': 'assets/images/politics.jpeg', 'category': 'Politics', 'date': 'Mar 15, 2025'},
      {'image': 'assets/images/business.jpeg', 'category': 'Startup', 'date': 'Feb 10, 2025'},
      {'image': 'assets/images/technology.jpeg', 'category': 'Business', 'date': 'Mar 15, 2025'},
    ];

    final event = events[index % events.length];

    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(event['image']!),
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
              padding: const EdgeInsets.all(10),
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
                    event['category']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    event['date']!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
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
