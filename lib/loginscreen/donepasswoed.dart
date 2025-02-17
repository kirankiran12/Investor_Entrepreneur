import 'package:flutter/material.dart';


class DonepasswordScreen extends StatefulWidget {
  const  DonepasswordScreen({super.key});

  @override
  State< DonepasswordScreen> createState() => _DonepasswordScreenState();
}

class _DonepasswordScreenState extends State< DonepasswordScreen> {
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
                  'Password changed  \nsuccessfully !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
