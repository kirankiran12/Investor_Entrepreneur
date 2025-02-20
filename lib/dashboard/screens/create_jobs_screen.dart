import 'package:flutter/material.dart';
import 'package:investorentrepreneur/screen/home/create/jobcreate/donejob.dart';

import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
import 'package:investorentrepreneur/widget/custom_textformfield.dart';

class CreateJobsScreen extends StatefulWidget {
  const CreateJobsScreen({super.key});

  @override
  State<CreateJobsScreen> createState() => _CreateJobsScreenState();
}

class _CreateJobsScreenState extends State<CreateJobsScreen> {
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController workplaceController = TextEditingController();
  final TextEditingController jobShiftController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final salaryController = TextEditingController();
  final travelTimeController = TextEditingController();
  final languageController = TextEditingController();
  final locationController = TextEditingController();
  final jobtypeController = TextEditingController();
  final selectlocationController = TextEditingController();
  final writeocationController = TextEditingController();
  final descriptionController = TextEditingController();

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
                    "Create Job",
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
                      'Job Title*',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  _buildDropdownField(
                    context: context,
                    controller: jobTitleController,
                    hint: 'Enter title',
                    options: [
                      "Tech&Entrepreneur",
                      "Tech&Investor",
                      "TeamWork",
                      "Security",
                      "Health Care",
                      "Education&Instruction",
                      "Administrative",
                      "Business",
                      "Marketing",
                      "Public Relation",
                      "Community",
                      "Real Estate",
                      "Other (please specify)",
                    ],
                    label: 'Select Job Title',
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Workplace Type',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  _buildDropdownField(
                    context: context,
                    controller: workplaceController,
                    hint: 'Select workplace type',
                    options: [
                      "Remote Only",
                      "On-site Only",
                      "Hybrid",
                      "Flexible",
                      "Location Dependent",
                      "Other (please specify)",
                    ],
                    label: 'Select Workplace Type',
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Job Shift',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  _buildDropdownField(
                    context: context,
                    controller: jobShiftController,
                    hint: 'Select job shift',
                    options: [
                      "Day Shift",
                      "Night Shift",
                      "Rotating Shift",
                      "Variable",
                      "Other (please specify)",
                    ],
                    label: 'Select Job Shift',
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Experience Level',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  _buildDropdownField(
                    context: context,
                    controller: experienceController,
                    hint: 'Select experience level',
                    options: [
                      "Entry-level",
                      "Mid-level",
                      "Senior",
                      "Executive",
                      "Internship",
                      "No experience required",
                      "Other (please specify)",
                    ],
                    label: 'Select Experience Level',
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Salary Range',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  _buildDropdownField(
                      context: context,
                      controller: salaryController,
                      hint: r'$20,000_$30,000',
                      options: [
                        r'$30,000_$50,000',
                        r'$50,000_$80,000',
                        r'$80,000_$120,000',
                        r'$120,000  and above',
                        "Other (please specify)"
                      ],
                      label: 'Select Salary range'),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'No travel',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  _buildDropdownField(
                      context: context,
                      controller: travelTimeController,
                      hint: '',
                      options: [
                        "No travel",
                        "Occasional travel",
                        "Frequent travel",
                        "Domestic travel",
                        "International travel",
                        "Other (Please specify)"
                      ],
                      label: 'Select Travel'),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'English',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  _buildDropdownField(
                      context: context,
                      controller: salaryController,
                      hint: '',
                      options: [
                        "English",
                        "Spanish",
                        "French",
                        "German",
                        "Other (please specify)"
                      ],
                      label: 'Select Language'),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Full time',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  _buildDropdownField(
                      context: context,
                      controller: jobtypeController,
                      hint: '',
                      options: [
                        "Full time",
                        "Part time",
                        "Contract",
                        "Temporary",
                        "Internship",
                        "Other (please specify)"
                      ],
                      label: 'SelectJobtype'),
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
                    controller: writeocationController,
                    hint: 'Write location',
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Job description',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  CustomTextFormField(
                    controller: descriptionController,
                    maxLines: 3,
                    hint: 'Write job description...',
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: CustomElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobdoneScreen()));
                      },
                      text: 'Post job',
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
}
