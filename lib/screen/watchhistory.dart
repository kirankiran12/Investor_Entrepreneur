
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/podcastplayer.dart';
import 'package:investorentrepreneur/widget/videoplayer.widget.dart';

class WatchHistory extends StatefulWidget {
  const WatchHistory({super.key});

  @override
  State<WatchHistory> createState() => _WatchHistoryState();
}

class _WatchHistoryState extends State<WatchHistory> {
  String _selectedFilter = "All";
  final List<String> _filters = ["All", "Videos", "Podcasts", "Events"];

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
              _buildDropdownFilter(),
              const SizedBox(height: 20),
              Expanded(
                child: _buildFilteredContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        const Text(
          "Watch Content",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildDropdownFilter() {
    return DropdownButton<String>(dropdownColor: Colors.white,
      value: _selectedFilter,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black, fontSize: 16),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (String? newValue) {
        setState(() {
          _selectedFilter = newValue!;
        });
      },
      items: _filters.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildFilteredContent() {
    switch (_selectedFilter) {
      case "Videos":
        return _buildCategorySection("Videos", _buildVideoCard);
      case "Podcasts":
        return _buildCategorySection("Podcasts", _buildPodcastCard);
      case "Events":
        return _buildCategorySection("Events", _buildEventCard);
      default:
        return ListView(
          children: [
            _buildCategorySection("Videos", _buildVideoCard),
            const SizedBox(height: 20),
            _buildCategorySection("Podcasts", _buildPodcastCard),
            const SizedBox(height: 20),
            _buildCategorySection("Events", _buildEventCard),
          ],
        );
    }
  }

  Widget _buildCategorySection(String title, Widget Function(int) itemBuilder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GridViewScreen(
                      title: title,
                    ),
                  ),
                );
              },
              child: const Text(
                "See All",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        _buildHorizontalList(itemBuilder),
      ],
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
    final podcasts = [
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
    ];

    final podcast = podcasts[index % podcasts.length];

    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(podcast['image']!),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Podcastplayer()),
                  );
                },
                icon: const Icon(
                  Icons.bookmark_outline,
                  color: Colors.white,
                )),
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
                    podcast['category']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    podcast['name']!,
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
                        podcast['time']!,
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
      {
        'image': 'assets/images/technology.jpeg',
        'category': 'Business',
        'date': 'Mar 15, 2025'
      },
      {
        'image': 'assets/images/business.jpeg',
        'category': 'Startup',
        'date': 'Feb 10, 2025'
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

class GridViewScreen extends StatelessWidget {
  final String title;

  const GridViewScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          switch (title) {
            case "Videos":
              return _buildVideoCard(index);
            case "Podcasts":
              return _buildPodcastCard(index);
            case "Events":
              return _buildEventCard(index);
            default:
              return Container();
          }
        },
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
      onTap: () {
        
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: VideoPlayerWidget(
            videoPath: video['path']!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildPodcastCard(int index) {
    final podcasts = [
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
    ];

    final podcast = podcasts[index % podcasts.length];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(podcast['image']!),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
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
                    podcast['category']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    podcast['name']!,
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

  Widget _buildEventCard(int index) {
    final events = [
      {
        'image': 'assets/images/technology.jpeg',
        'category': 'Business',
        'date': 'Mar 15, 2025'
      },
      {
        'image': 'assets/images/business.jpeg',
        'category': 'Startup',
        'date': 'Feb 10, 2025'
      },
    ];

    final event = events[index % events.length];

    return Container(
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
