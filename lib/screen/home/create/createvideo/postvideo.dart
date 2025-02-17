import 'package:flutter/material.dart';

class Postvideo extends StatefulWidget {
  const Postvideo({super.key});

  @override
  State<Postvideo> createState() => _PostvideoState();
}

class _PostvideoState extends State<Postvideo> {
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
              Stack(children: [
                Container(
                  width: 500,
                  height: 500,
                  child: Image.asset(
                    'assets/images/tech.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 80,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                          Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )),
                ),
                Positioned(
                  top: 4,
                  right: 0,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, shape: CircleBorder()),
                      child: Icon(
                        Icons.close_outlined,
                        color: Colors.black,
                      )),
                ),
              ]),
              SizedBox(
                height: 30,
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
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        Row(
          children: [
            const Text(
              "Anyone",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
              onPressed: () {
                _showBottomSheet(context);
              },
            ),
            SizedBox(
              width: 70,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 8, 89, 230)),
                onPressed: () {},
                child: Text(
                  'post',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ],
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: Text(
                'Who can see this post?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              ListTile(
                leading:
                    const Icon(Icons.language_outlined, color: Colors.black),
                title: const Text("Anyone"),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const Createvideo()),
                  // );
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.group, color: Colors.black),
                title: const Text("Subscriber only"),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading:
                    const Icon(Icons.archive_outlined, color: Colors.black),
                title: const Text("Archive"),
                onTap: () {},
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
