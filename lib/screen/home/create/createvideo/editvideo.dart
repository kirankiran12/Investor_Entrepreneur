import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/home/create/createvideo/postvideo.dart';

class Editvideo extends StatefulWidget {
  const Editvideo({super.key});

  @override
  State<Editvideo> createState() => _EditvideoState();
}

class _EditvideoState extends State<Editvideo> {
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
              Container(
                width: 500,
                height: 500,
                child: Image.asset(
                  'assets/images/tech.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 178, 200, 237)),
                  onPressed: () {
                    
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.content_cut_sharp,
                        color: Colors.black,
                        size: 20,
                      ),
                      Icon(
                        Icons.title,
                        color: Colors.black,
                        size: 20,
                      ),
                      Icon(
                        Icons.closed_caption_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                      Icon(
                        Icons.photo_size_select_large,
                        color: Colors.black,
                        size: 20,
                      ),
                    ],
                  ))
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
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        Row(
          children: [
            const Text(
              "Cancel",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 140,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 178, 200, 237)),
                onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Postvideo()));
                },
                child: Text(
                  'Next',
                  style:
                      TextStyle(color: const Color.fromARGB(255, 8, 89, 230)),
                ))
          ],
        ),
      ],
    );
  }
}
