import 'package:flutter/material.dart';
import 'package:investorentrepreneur/widget/outlinegradientbutton.dart';

class Eventdone extends StatefulWidget {
  const Eventdone({super.key});

  @override
  State<Eventdone> createState() => _EventdoneState();
}

class _EventdoneState extends State<Eventdone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(255, 172, 147, 240),
                        width: 2,
                      ),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.done,
                      size: 30,
                      color: Color.fromARGB(255, 172, 147, 240),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                const Text(
                  'Event successfully \n Created!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientOutlinedButton(
                    onPressed: () {},
                    icon: Icons.insert_link_outlined,
                    text: 'Copy link',
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.blue,
                            Colors.purple,
                            Colors.red,
                            Colors.orange,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.screen_share_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Share',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
