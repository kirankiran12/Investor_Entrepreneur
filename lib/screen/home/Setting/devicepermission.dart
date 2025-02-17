import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';

class Devicepermission extends StatefulWidget {
  const Devicepermission({super.key});

  @override
  State<Devicepermission> createState() => _DevicepermissionState();
}

class _DevicepermissionState extends State<Devicepermission> {
  Map<String, bool> permissionStates = {
    'Camera': false,
    'Contact': false,
    'Location': false,
    'Microphone': false,
    'Notification': false,
    'Gallery': false,
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.03,
          ),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left_sharp,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomText(
                    text: "Device Permission",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your Preferences',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 15),
              ...permissionStates.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            entry.key,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Switch(
                            value: entry.value,
                            activeColor: Colors.blue,
                            onChanged: (bool newValue) {
                              setState(() {
                                permissionStates[entry.key] = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
