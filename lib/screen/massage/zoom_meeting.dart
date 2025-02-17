
import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
import 'package:investorentrepreneur/widget/custom_textformfield.dart';

class CreateZoomMeeting extends StatefulWidget {
  const CreateZoomMeeting({super.key});

  @override
  State<CreateZoomMeeting> createState() => _CreateZoomMeetingState();
}

class _CreateZoomMeetingState extends State<CreateZoomMeeting> {
  final meetingController = TextEditingController();
  final emailController = TextEditingController();
  final linkController = TextEditingController();
  final dateController = TextEditingController();
  final massageController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final timeZoneController = TextEditingController();

  String? selectedCountryCode;
  String? phoneNumber;

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
                    icon: Icon(Icons.chevron_left_sharp,
                        size: 30, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomText(
                    text: "Create a Zoom Meeting",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'To:',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  _buildPersonButton('Host', screenWidth),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Meeting Title*',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  CustomTextFormField(
                    controller: meetingController,
                    hint: 'First Interview',
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Your Time Zone',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  TextFormField(
                    controller: timeZoneController,
                    decoration: InputDecoration(
                      hintText: 'Select Time Zone',
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    readOnly: true,
                    onTap: () async {
                      // Show time zones dropdown
                      List<String> timeZones = ["UTC+0", "UTC+5:30", "UTC+8"];
                      String? selectedTimeZone = await showDialog<String>(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(backgroundColor: Colors.white,
                            title: const Text('Select Time Zone'),
                            children: timeZones
                                .map((zone) => SimpleDialogOption(
                                      onPressed: () =>
                                          Navigator.pop(context, zone),
                                      child: Text(zone),
                                    ))
                                .toList(),
                          );
                        },
                      );
                      if (selectedTimeZone != null) {
                        timeZoneController.text = selectedTimeZone;
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Date*',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      hintText: 'Select Date',
                      suffixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.blue,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        dateController.text =
                            '${pickedDate.toLocal()}'.split(' ')[0];
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Text(
                        'Start Time*',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(width: 80),
                      const Text(
                        'End Time*',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: startTimeController,
                          decoration: InputDecoration(
                            hintText: 'Select Start Time',
                            suffixIcon: Icon(Icons.access_time),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          readOnly: true,
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime != null) {
                              startTimeController.text =
                                  pickedTime.format(context);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextFormField(
                          controller: endTimeController,
                          decoration: InputDecoration(
                            hintText: 'Select End Time',
                            suffixIcon: Icon(Icons.access_time),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          readOnly: true,
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime != null) {
                              endTimeController.text =
                                  pickedTime.format(context);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Paste Call Link*',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  CustomTextFormField(
                    controller: linkController,
                    hint: 'http://meet.google.com/del-otch-our',
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Any Message*',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  CustomTextFormField(
                    controller: massageController,
                    maxLines: 3,
                    hint: 'Type message...',
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: CustomElevatedButton(
                      onPressed: () {
                     
                      },
                      text: 'Schedule Meeting',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPersonButton(String label, double screenWidth) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          children: [
            CircleAvatar(
              radius: screenWidth * 0.03,
              backgroundImage: AssetImage('assets/images/men.jpeg'),
            ),
            SizedBox(width: screenWidth * 0.02),
            Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenWidth * 0.025,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.05),
          ),
        ),
      ),
    );
  }
}
