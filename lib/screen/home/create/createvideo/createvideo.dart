import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/home/create/createvideo/editvideo.dart';

class Createvideo extends StatefulWidget {
  const Createvideo({super.key});

  @override
  State<Createvideo> createState() => _CreatevideoState();
}

class _CreatevideoState extends State<Createvideo> {
  List<bool> selectedImages = List.generate(10, (_) => false);
  List<int> selectionCount = List.generate(10, (_) => 0);
  int totalSelectedCount = 0;

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
              Expanded(child: _buildGridView()),
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
          "Create video",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 2),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedImages[index] = !selectedImages[index];

                if (selectedImages[index]) {
                  totalSelectedCount++;
                  selectionCount[index] = totalSelectedCount;
                } else {
                  totalSelectedCount--;
                  selectionCount[index] = 0;
                }
              });
            },
            child: _buildEventCard(index),
          ),
        );
      },
    );
  }

  Widget _buildEventCard(int index) {
    final events = [
      {'image': 'assets/images/techmages.jpeg', 'time': '0:01'},
      {'image': 'assets/images/tech.jpeg', 'time': '0:20'},
      {'image': 'assets/images/ticketdetail.jpeg', 'time': '0:28'},
      {'image': 'assets/images/politicsimage.jpeg', 'time': '0:07'},
      {'image': 'assets/images/politics.jpeg', 'time': '0:26'},
      {'image': 'assets/images/marketing.jpeg', 'time': '0:20'},
      {'image': 'assets/images/business.jpeg', 'time': '0:07'},
    ];

    final event = events[index % events.length];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(event['image']!),
          fit: BoxFit.cover,
        ),
        border: selectedImages[index]
            ? Border.all(color: Colors.blue, width: 2)
            : Border.all(color: Colors.transparent),
      ),
      child: Stack(
        children: [
          if (selectedImages[index])
            Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${selectionCount[index]}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 5),
                  Container(
                    width: 70,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Editvideo()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(0.3),
                      ),
                      child: Center(
                        child: Text(
                          event['time']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
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
