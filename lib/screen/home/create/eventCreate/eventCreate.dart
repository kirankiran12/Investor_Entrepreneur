import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/home/create/eventCreate/eventdone.dart';

import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
import 'package:investorentrepreneur/widget/custom_textformfield.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
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
                    icon: const Icon(Icons.chevron_left_sharp,
                        size: 30, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    "Create Event",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Event title*',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  CustomTextFormField(
                    controller: titleController,
                    hint: 'Event title',
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Event type*',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildDropdownField(
                    context: context,
                    controller: eventtypeController,
                    hint: 'Event type*',
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
                          controller: starttimeController,
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
                              starttimeController.text =
                                  pickedTime.format(context);
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
                              endtimeController.text =
                                  pickedTime.format(context);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
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
                  const SizedBox(height: 15),
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
                  const SizedBox(height: 15),
                  _buildDropdownField(
                    context: context,
                    controller: eventcategoryController,
                    hint: 'Event category*',
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
                  ),
                  CustomTextFormField(
                    controller: selectlocationController,
                    hint: 'Select location',
                    suffixIcon: Icon(
                      Icons.location_on_outlined,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 15),
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
                  const SizedBox(height: 15),
                  _buildDropdownField(
                    context: context,
                    controller: formatController,
                    hint: 'Event hybrid*',
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
                  ),
                  _buildDropdownField(
                    context: context,
                    controller: networkingController,
                    hint: 'speed Networking',
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
                  ),
                  _buildDropdownField(
                      context: context,
                      controller: tickettypeController,
                      hint: 'Basic',
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
                  ),
                  _buildDropdownField(
                      context: context,
                      controller: eventdurationController,
                      hint: 'half day',
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
                      'No of people attended*',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildDropdownField(
                      context: context,
                      controller: attendedController,
                      hint: 'less then 20',
                      options: [
                        'less then 20',
                        'less then 50',
                        'above  50',
                        "please(specify other)",
                      ],
                      label: "Select No of people attended "),
                  const SizedBox(height: 15),
                  const SizedBox(height: 30),
                  Center(
                    child: CustomElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Eventdone()));
                      },
                      text: 'Publish Event',
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
                        }).toList(),
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

//   Widget _buildField({
//     required BuildContext context,
//     required TextEditingController controller,
//     required String hint,
//     required List<String> options,
//     required String label,
//   }) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: hint,
//         suffixIcon: const Icon(Icons.keyboard_arrow_down),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.grey.withOpacity(0.3),
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.grey.withOpacity(0.3),
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//       readOnly: true,
//       onTap: () async {
//         String? selectedOption = await showDialog<String>(
//           context: context,
//           builder: (context) {
//             TextEditingController otherController = TextEditingController();
//             bool isOtherSelected = false;
//             String? selectedButton;

//             return StatefulBuilder(
//               builder: (context, setState) {
//                 return AlertDialog(
//                   backgroundColor: Colors.white,
//                   title: Text(label),
//                   content: SingleChildScrollView(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         GridView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2, // 2 buttons per row
//                             crossAxisSpacing: 10,
//                             mainAxisSpacing: 10,
//                             childAspectRatio: 3, // Button's aspect ratio
//                           ),
//                           itemCount: options.length,
//                           itemBuilder: (context, index) {
//                             final option = options[index];
//                             final isSelected = selectedButton == option;

//                             return GestureDetector(
//                               onTap: () {
//                                 if (option == "Other (please specify)") {
//                                   setState(() {
//                                     isOtherSelected = true;
//                                     selectedButton = null;
//                                   });
//                                 } else {
//                                   setState(() {
//                                     isOtherSelected = false;
//                                     selectedButton = option;
//                                     controller.text = option;
//                                   });
//                                   Navigator.pop(context, option);
//                                 }
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   gradient: isSelected
//                                       ? LinearGradient(colors: [
//                                          Colors.blue, Colors.purple, Colors.red, Colors.orange
//                                         ])
//                                       : LinearGradient(colors: [
//                                           Colors.grey[200]!,
//                                           Colors.grey[300]!,
//                                         ]),
//                                   borderRadius: BorderRadius.circular(8),
//                                   border: Border.all(
//                                     color:
//                                         isSelected ? Colors.blue : Colors.grey,
//                                     width: 1,
//                                   ),
//                                 ),
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   option,
//                                   style: TextStyle(
//                                     color: isSelected
//                                         ? Colors.white
//                                         : Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         if (isOtherSelected)
//                           Padding(
//                             padding: const EdgeInsets.only(top: 16.0),
//                             child: TextField(
//                               controller: otherController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Please specify',
//                                 border: OutlineInputBorder(),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                   actions: [
//                     if (isOtherSelected)
//                       CustomElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context, otherController.text);
//                           },
//                           text: "Submit")
//                   ],
//                 );
//               },
//             );
//           },
//         );

//         if (selectedOption != null && selectedOption.isNotEmpty) {
//           controller.text = selectedOption;
//         }
//       },
//     );
//   }
}
