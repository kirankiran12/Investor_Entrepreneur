import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/widget/custom_textformfield.dart';

class Profileinfo extends StatefulWidget {
  const Profileinfo({super.key});

  @override
  State<Profileinfo> createState() => _ProfileinfoState();
}

class _ProfileinfoState extends State<Profileinfo> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final noController = TextEditingController();
  final dateController = TextEditingController();
  final passwordController = TextEditingController();

  String selectedCountryCode = "+92";
  String selectedCountryFlag = "🇵🇰";

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      searchAutofocus: true,
      countryListTheme: CountryListThemeData(
        borderRadius: BorderRadius.circular(15),
        inputDecoration: InputDecoration(
          labelText: 'Search Country',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onSelect: (Country country) {
        setState(() {
          selectedCountryCode = "+${country.phoneCode}";
          selectedCountryFlag = country.flagEmoji;
        });
      },
    );
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.chevron_right_sharp,
                        size: 30, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CustomText(
                    text: "Profile information",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profileinfo()),
                      );
                    },
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.blue),
                    ),
                  ),
                  const Icon(Icons.edit, size: 15, color: Colors.blue),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Personal information',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 15),
              const Text(
                'Full name*',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              CustomTextFormField(
                  controller: nameController, hint: 'Enter your name'),
              const SizedBox(height: 15),
              const Text(
                'Date of birth',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              CustomTextFormField(
                  controller: dateController, hint: '03 June 2007'),
              const SizedBox(height: 15),
              const Text(
                'Account information',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 15),
              const Text(
                'Email',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              CustomTextFormField(
                  controller: emailController, hint: 'abc123@gmail.com'),
              const SizedBox(height: 15),
              const Text(
                'Phone Number',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: _showCountryPicker,
                      child: Row(
                        children: [
                          Text(
                            selectedCountryFlag,
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            selectedCountryCode,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const Icon(Icons.arrow_drop_up,
                              size: 18, color: Colors.black),
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 40,
                            child: VerticalDivider(
                              color: Colors.grey[300],
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: noController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Enter phone number',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Password*',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              CustomTextFormField(
                  controller: passwordController, hint: '*********'),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
