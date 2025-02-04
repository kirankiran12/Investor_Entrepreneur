import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/home/reviews/createreviews.dart';

// import 'package:investorentrepreneur/home/filter/filterscreen.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
import 'package:video_player/video_player.dart';

class ReelsScreen extends StatefulWidget {
  final List<String> videos;
  final int initialIndex;

  const ReelsScreen(
      {super.key, required this.videos, required this.initialIndex});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  late PageController _pageController;
  late List<VideoPlayerController> _controllers;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
    _controllers = widget.videos
        .map((video) => VideoPlayerController.asset(video)..initialize())
        .toList();
    _playVideo(widget.initialIndex);
  }

  void _playVideo(int index) {
    for (var controller in _controllers) {
      controller.pause();
    }
    _controllers[index].setLooping(true);
    _controllers[index].play();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child:
                Image.asset("assets/images/background.jpg", fit: BoxFit.cover),
          ),
          PageView.builder(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            itemCount: widget.videos.length,
            onPageChanged: (index) => _playVideo(index),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controllers[index].value.size?.width ?? 0,
                        height: _controllers[index].value.size?.height ?? 0,
                        child: VideoPlayer(_controllers[index]),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 15,
                    right: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.video_collection,
                                color: Colors.white, size: 28),
                            SizedBox(width: 8),
                            Text("Videos",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_back,
                              color: Colors.white, size: 30),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 15,
                    bottom: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _profileIcon(),
                        SizedBox(height: 20),
                        _sideIcon(Icons.report_outlined, "Report", context,
                            _showReportBottomSheet),
                        SizedBox(height: 20),
                        _sideIcon(Icons.reviews_outlined, "Reviews", context,
                            _showReviewBottomSheet),
                        SizedBox(height: 20),
                        _sideIcon(Icons.share, "Share", context, (){}),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 15,
                    bottom: 40,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("@azita_darvishi",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 5),
                          Text("Checkout new Apple Vision - it's amazing!",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.music_note,
                                  color: Colors.white, size: 16),
                              SizedBox(width: 5),
                              Text("Original Sound",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ]),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _sideIcon(
      IconData icon, String text, BuildContext context, Function onTap) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.white, size: 30),
          onPressed: () => onTap(),
        ),
        SizedBox(height: 5),
        Text(text, style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget _profileIcon() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.jpeg"),
          radius: 25,
        ),
        Positioned(
          bottom: -5,
          child: CircleAvatar(
            radius: 10,
            backgroundColor: Colors.blue,
            child: Icon(Icons.add, size: 14, color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _showReportBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            String? selectedReason;

            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.5,
              minChildSize: 0.3,
              maxChildSize: 0.9,
              builder: (context, scrollController) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Report Video",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Divider(),
                      SizedBox(height: 10),
                      Text("Why are you reporting this video?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text("I just don't like it .",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal)),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView(
                          controller: scrollController,
                          children: [
                            ...[
                              "It's Spam",
                              "Inappropriate Content",
                              "Privacy Violation",
                              "Harassment",
                              "Fraud or Scam",
                              "Hate Speech or Symbol",
                              "False Information",
                              "Suicide and Injury",
                              "Nudity and Sexual Activity",
                              "Eating Disorder",
                              "Other"
                            ].map((reason) => ListTile(
                                  leading: Checkbox(
                                    value: selectedReason == reason,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedReason = reason;
                                      });
                                      Future.delayed(
                                          Duration(milliseconds: 200), () {
                                        _showSpecifyReasonBottomSheet(reason);
                                      });
                                    },
                                  ),
                                  title: Text(reason),
                                  onTap: () {
                                    setState(() {
                                      selectedReason = reason;
                                    });
                                    Future.delayed(Duration(milliseconds: 200),
                                        () {
                                      _showSpecifyReasonBottomSheet(reason);
                                    });
                                  },
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void _showSpecifyReasonBottomSheet(String reason) {
    TextEditingController _controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Please specify why you are reporting this.",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: _controller,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Enter your reason here...",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                  ),
                ),
                SizedBox(height: 200),
                CustomElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    text: 'Submit'),
                SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showReviewBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          bool showAllReviews = false;

          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.5,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Column(
                          children: [
                            Container(margin: EdgeInsets.only(left: 130),
                              child: Text("Reviews",
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Divider(),
                        SizedBox(height: 10),
                        Text("Average Rating",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text("47.",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 90),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CreaterViews()),
                                );
                              },
                              child: const Text(
                                "Write Reviews",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text("352 total reviews",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal)),
                        Divider(),
                        _buildReviewItem(),
                        _buildReviewItem(),
                        _buildReviewItem(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showAllReviews = !showAllReviews;
                            });
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  showAllReviews
                                      ? "Hide reviews"
                                      : "Show more reviews",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                                Icon(
                                  showAllReviews
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (showAllReviews) ...[
                          _buildReviewItem(),
                          _buildReviewItem(),
                          _buildReviewItem(),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
      },
    );
  }

  Widget _buildReviewItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.jpeg"),
              radius: 25,
            ),
            SizedBox(width: 10),
            Text("Sofia-gene",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              size: 20,
              color: Colors.amber,
            ),
            Icon(
              Icons.star,
              size: 20,
              color: Colors.amber,
            ),
            Icon(
              Icons.star,
              size: 20,
              color: Colors.amber,
            ),
            Icon(
              Icons.star,
              size: 20,
              color: Colors.amber,
            ),
            Icon(
              Icons.star,
              size: 20,
              color: Colors.amber,
            ),
            Text("(5.0)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("view 5 replies",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            Text("Report",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        Divider(),
      ],
    );
  }
}
