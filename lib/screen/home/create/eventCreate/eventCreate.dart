import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investorentrepreneur/models/events_model.dart';
import 'package:investorentrepreneur/screen/home/create/eventCreate/eventdone.dart';
import 'package:investorentrepreneur/services/firestore_service.dart';
import 'package:investorentrepreneur/services/storage_service.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
import 'package:investorentrepreneur/widget/custom_textformfield.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {

  final FirestoreService _firestoreService = FirestoreService();
  final FirebaseStorageService _firebaseStorageService =FirebaseStorageService();

  final TextEditingController titleController = TextEditingController();
  final eventcategoryController = TextEditingController();
  final dateController = TextEditingController();
  final endtimeController = TextEditingController();
  final starttimeController = TextEditingController();
  final eventtypeController = TextEditingController();
  final descriptionController = TextEditingController();

  final selectlocationController = TextEditingController();
  final writelocationController = TextEditingController();
  final formatController = TextEditingController();
  final tickettypeController = TextEditingController();
  final networkingController = TextEditingController();
  final eventdurationController = TextEditingController();
  final attendedController = TextEditingController();
  bool isLoading = false;

  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // Function to upload image to Firebase Storage

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Create Event",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Event Image*',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: _imageFile == null
                      ? Center(
                          child: Icon(
                            Icons.add_a_photo,
                            size: 50,
                            color: Colors.grey,
                          ),
                        )
                      : Image.file(
                          _imageFile!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Event Title',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),const SizedBox(height: 10),
              CustomTextFormField(
                controller: titleController,
                hint: '  Event Title',
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Event type',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                context: context,
                controller: eventtypeController,
                hint: ' Select Event type',
                options: [
                  "Trade show",
                  "Seminar",
                  "Workshope",
                  "other(please specfiy)"
                ],
                label: 'Select Event type',
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select date*',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),const SizedBox(height: 10),
              TextFormField(
                controller: dateController,
                decoration: InputDecoration(
                  hintText: 'Select Date',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
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
                  const SizedBox(width: 90),
                  const Text(
                    'End Time*',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: starttimeController,
                      decoration: InputDecoration(
                        hintText: 'Select Start Time',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
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
                          starttimeController.text = pickedTime.format(context);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextFormField(
                      controller: endtimeController,
                      decoration: InputDecoration(
                        hintText: 'Select End Time',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
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
                          endtimeController.text = pickedTime.format(context);
                        }
                      },
                    ),
                  ),
                ],
              ),const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Event description*',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: descriptionController,
                maxLines: 3,
                hint: 'Write  event description...',
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Event Category*',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                context: context,
                controller: eventcategoryController,
                hint: 'Select Event category',
                options: [
                  "Tech&Entrepreneur",
                  "Tech&Investor",
                  "Art"
                      "finance",
                  "Networkiing",
                  "Government",
                  "charity",
                  "language",
                  "politics",
                  "fashion",
                  "History",
                  "networking",
                  "Hobbies",
                ],
                label: 'Select Event category',
              ),
             
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Location',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),const SizedBox(height: 10),
              CustomTextFormField(
                controller: selectlocationController,
                hint: 'Select location',
                suffixIcon: Icon(
                  Icons.location_on_outlined,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: writelocationController,
                hint: 'Write location',
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Event Format*',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                context: context,
                controller: formatController,
                hint: 'Select Event format',
                options: [
                  "in-person",
                  "virtual",
                  "hybrid"
                      "pre-recorded content",
                  "please(specify other)",
                ],
                label: 'Select Event format',
              ),
              const SizedBox(height: 15),
            
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Networking Opportunities*',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),const SizedBox(height: 10),
              _buildDropdownField(
                context: context,
                controller: networkingController,
                hint: 'Select Networking Opportunities',
                options: [
                  "speed Networking"
                      "in-person",
                  "Roundable disscssion",
                  "Social mixer",
                  "panel discussions",
                  "Q&A Sessions",
                  "Ongoing Registration"
                      "please(specify other)",
                ],
                label: 'Select Networking Opportunities ',
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ticket type*',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),const SizedBox(height: 10),
              _buildDropdownField(
                  context: context,
                  controller: tickettypeController,
                  hint: 'Select ticket type',
                  options: [
                    "Basic",
                    "Vip",
                    "Reserved",
                    "please(specify other)",
                  ],
                  label: "Select ticket type"),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Event duration*',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),const SizedBox(height: 10),
              _buildDropdownField(
                  context: context,
                  controller: eventdurationController,
                  hint: 'Select Event duration',
                  options: [
                    "half day",
                    "Full day",
                    "Morning Event",
                    "Multiple days",
                    "Afternoon Event",
                    "Evenning Event",
                    "Quick Sessions(1-2 hour)",
                    "please(specify other)",
                  ],
                  label: "Select Event duration"),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'No of people attended',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              _buildDropdownField(
                  context: context,
                  controller: attendedController,
                  hint: 'Select No of people attended',
                  options: [
                    'less then 20',
                    'less then 50',
                    'above  50',
                    "please(specify other)",
                  ],
                  label: "Select No of people attended "),
              const SizedBox(height: 15),
              const SizedBox(height: 30),
              CustomElevatedButton(
                isLoading: isLoading,
                onPressed: () async {
                  if (_validateForm()) {
                    setState(() {
                      isLoading = true;
                    });
                    String? imageUrl =
                        await _firebaseStorageService.uploadImage(_imageFile!);
                    DocumentReference docRef =
                        FirebaseFirestore.instance.collection('events').doc();
                    Event event = Event(
                        id: docRef.id.toString(),
                        title: titleController.text,
                        eventType: eventtypeController.text,
                        date: dateController.text,
                        startTime: starttimeController.text,
                        endTime: endtimeController.text,
                        description: descriptionController.text,
                        eventCategory: eventcategoryController.text,
                        selectLocation: selectlocationController.text,
                        writeLocation: writelocationController.text,
                        eventFormat: formatController.text,
                        networkingOpportunities: networkingController.text,
                        ticketType: tickettypeController.text,
                        eventDuration: eventdurationController.text,
                        numberOfPeopleAttended: attendedController.text,
                        imageUrl: imageUrl!);
                    await _firestoreService.addEvent(event).then((value) {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Eventdone()));
                    }).onError((error, stackTrace) {
                      print(error.toString());
                      setState(() {
                        isLoading = false;
                      });
                    });
                  }
                },
                text: 'Publish Event',
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    if (titleController.text.isEmpty ||
        eventtypeController.text.isEmpty ||
        dateController.text.isEmpty ||
        starttimeController.text.isEmpty ||
        endtimeController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        eventcategoryController.text.isEmpty ||
        formatController.text.isEmpty ||
        networkingController.text.isEmpty ||
        tickettypeController.text.isEmpty ||
        eventdurationController.text.isEmpty ||
        attendedController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill all required fields"),
        ),
      );
      return false;
    }
    return true;
  }

  Widget _buildDropdownField({
    required BuildContext context,
    required TextEditingController controller,
    required String hint,
    required List<String> options,
    required String label,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        suffixIcon: const Icon(Icons.keyboard_arrow_down),
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
        String? selectedOption = await showDialog<String>(
          context: context,
          builder: (context) {
            TextEditingController otherController = TextEditingController();
            bool isOtherSelected = false;

            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: Text(label),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...options.map((option) {
                          return RadioListTile<String>(
                            title: Text(option),
                            value: option,
                            groupValue:
                                isOtherSelected ? null : controller.text,
                            onChanged: (value) {
                              if (value == "Other (please specify)") {
                                setState(() {
                                  isOtherSelected = true;
                                });
                              } else {
                                setState(() {
                                  isOtherSelected = false;
                                  controller.text = value!;
                                });
                                Navigator.pop(context, value);
                              }
                            },
                          );
                        }),
                        if (isOtherSelected)
                          TextField(
                            controller: otherController,
                            decoration: const InputDecoration(
                              labelText: 'Please specify',
                              border: OutlineInputBorder(),
                            ),
                          ),
                      ],
                    ),
                  ),
                  actions: [
                    if (isOtherSelected)
                      CustomElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, otherController.text);
                          },
                          text: "Submit")
                  ],
                );
              },
            );
          },
        );

        if (selectedOption != null && selectedOption.isNotEmpty) {
          controller.text = selectedOption;
        }
      },
    );
  }
}
