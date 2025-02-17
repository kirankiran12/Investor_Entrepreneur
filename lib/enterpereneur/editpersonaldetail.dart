import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';

import 'package:investorentrepreneur/widget/custom_textformfield.dart';

class Editpersonaldetail extends StatefulWidget {
  const Editpersonaldetail({super.key});

  @override
  State<Editpersonaldetail> createState() => _EditpersonaldetailState();
}

class _EditpersonaldetailState extends State<Editpersonaldetail> {
  final descriptionController = TextEditingController();
  final nameController = TextEditingController();
  final workController = TextEditingController();
  final educationController = TextEditingController();
  final locationController = TextEditingController();
  final typeController = TextEditingController();
  final fundsController = TextEditingController();
  final experienceController = TextEditingController();

  bool isCustomTextFieldVisiblename = false;
    bool isCustomTextFieldVisiblework = false;
       bool isCustomTextFieldVisibleeducation = false;
          bool isCustomTextFieldVisiblelocation = false;
             bool isCustomTextFieldVisibletype = false;
               bool isCustomTextFieldVisiblefunds = false;
                bool isCustomTextFieldVisibleexperience = false;

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
            child: Column(children: [
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
                  Row(
                    children: [
                      CustomText(
                        text: "Personal Details",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Edit Description',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                CustomTextFormField(
                  maxLines: 6,
                  controller: descriptionController,
                  hint:
                      "I am [Entrepreneur's Name], a passionate investor dedicated to reshaping industries. With creativity and resilience, I thrive in the entrepreneurial realm, turning challenges into opportunities. Join me as I make my mark on the World. ",
                ),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Personal info',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Text(
                        'Full name',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Spacer(),
                       IconButton(
                    icon: Icon(isCustomTextFieldVisiblename ?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up,
                        size: 25, color: Colors.black),
                    onPressed: () {setState(() {
                       isCustomTextFieldVisiblename = !isCustomTextFieldVisiblename;
                    });
                 
                    },
                  ),
                    ],
                  ),
                ),
                if(isCustomTextFieldVisiblename)
                  CustomTextFormField(
                    controller: nameController,
                    hint: 'Azita Darvishi',
                  ),
                
                const SizedBox(height: 15),
                Divider(),   const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Text(
                        'Work',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                       Spacer(),
                       IconButton(
                    icon: Icon(
                       isCustomTextFieldVisiblework?Icons.keyboard_arrow_down:
                      Icons.keyboard_arrow_up,
                        size: 25, color: Colors.black),
                    onPressed: () {
                    setState(() {
                      isCustomTextFieldVisiblework =!isCustomTextFieldVisiblework;
                    });
                    },
                  ),
                    ],
                  ),
                ),
                if(isCustomTextFieldVisiblework)
                 CustomTextFormField(
                    controller: workController,
                    hint: '5 year',
                  ),
                
                const SizedBox(height: 15), Divider(),   const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Text(
                        'Education',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                       Spacer(),
                       IconButton(
                    icon: Icon(isCustomTextFieldVisibleeducation ?Icons.keyboard_arrow_down:
                      Icons.keyboard_arrow_up,
                        size: 25, color: Colors.black),
                    onPressed: () {
                     setState(() {
                       isCustomTextFieldVisibleeducation=!isCustomTextFieldVisibleeducation;
                     });
                    },
                  ),
                    ],
                  ),
                ),
                if(isCustomTextFieldVisibleeducation)
                CustomTextFormField(
                    controller: educationController,
                    hint: 'Bachelors in Marketing',
                  ),
                
                const SizedBox(height: 15), Divider(),   const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Text(
                        'Location',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                       Spacer(),
                       IconButton(
                    icon: Icon(isCustomTextFieldVisiblelocation?Icons.keyboard_arrow_down:
                      Icons.keyboard_arrow_up,
                        size: 25, color: Colors.black),
                    onPressed: () {
                   setState(() {
                     isCustomTextFieldVisiblelocation=!isCustomTextFieldVisiblelocation;
                   });
                    },
                  ),
                    ],
                  ),
                ),
                if(isCustomTextFieldVisiblelocation)
                  CustomTextFormField(
                    controller: locationController,
                    hint: 'Manchester, UK',
                  ),
              
                const SizedBox(height: 15), Divider(),   const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                 
                      child: Text(
                        'More info',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                       
                   
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Text(
                        'Type of Entrepreneur',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                       Spacer(),
                       IconButton(
                    icon: Icon(isCustomTextFieldVisibletype?Icons.keyboard_arrow_down:
                      Icons.keyboard_arrow_up,
                        size: 25, color: Colors.black),
                    onPressed: () {
                      setState(() {
                        isCustomTextFieldVisibletype=!isCustomTextFieldVisibletype;
                      });
                    },
                  ),
                    ],
                  ),
                ),
                if(isCustomTextFieldVisibletype)
                  CustomTextFormField(
                    controller: typeController,
                    hint: 'Artificial Intelligence (AI)',
                  ),
                
                const SizedBox(height: 15), Divider(),   const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Text(
                        'Funds',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                       Spacer(),
                       IconButton(
                    icon: Icon(isCustomTextFieldVisiblefunds?Icons.keyboard_arrow_down:
                      Icons.keyboard_arrow_up,
                        size: 25, color: Colors.black),
                    onPressed: () {
                     setState(() {
                       isCustomTextFieldVisiblefunds=!isCustomTextFieldVisiblefunds;
                     });
                    },
                  ),
                    ],
                  ),
                ),
                if(isCustomTextFieldVisiblefunds)
                CustomTextFormField(
                    controller: experienceController,
                    hint: r"$5 million",
                  ),
              
                const SizedBox(height: 15), Divider(),   const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Text(
                        'Experience*',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                       Spacer(),
                       IconButton(
                    icon: Icon(isCustomTextFieldVisibleexperience?Icons.keyboard_arrow_down:
                      Icons.keyboard_arrow_up,
                        size: 25, color: Colors.black),
                    onPressed: () {
                    setState(() {
                      isCustomTextFieldVisibleexperience=!isCustomTextFieldVisibleexperience;
                    });
                    },
                  ),
                    ],
                  ),
                ),
                if(isCustomTextFieldVisibleexperience)
                  CustomTextFormField(
                    controller: experienceController,
                    hint: '5 years',
                  ),
                
                const SizedBox(height: 15), Divider(),   const SizedBox(height: 15),
              ]),
            ]),
          ),
        ));
  }
}
