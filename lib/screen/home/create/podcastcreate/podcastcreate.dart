import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investorentrepreneur/models/podcast_model.dart';
import 'package:investorentrepreneur/services/firestore_service.dart';
import 'package:investorentrepreneur/services/storage_service.dart';


import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
import 'package:investorentrepreneur/widget/custom_textformfield.dart';

class Createpodcaste extends StatefulWidget {
  const Createpodcaste({super.key});

  @override
  State<Createpodcaste> createState() => _CreatepodcasteState();
}

class _CreatepodcasteState extends State<Createpodcaste> {
  final FirebaseStorageService _firebaseStorageService = FirebaseStorageService();
  final FirestoreService _firestoreService = FirestoreService();

  final TextEditingController titleController = TextEditingController();

  final podcastetypeController = TextEditingController();

  final descriptionController = TextEditingController();
  
  File? _imageFile;
  bool isLoading = false;
  Future<void> _pickImage()async{
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

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
          "Create Podcast",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded,size: 20,),
          onPressed: (){
            Navigator.pop(context);
          },),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.03,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: double.infinity,
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.3), width: 1)),
                      child: _imageFile == null ? Center(
                          child: Text(
                              "Record  or  upload\nSome audio, and it'll\nappear here ",style: TextStyle(color: Colors.grey),)):
                      Image.file(_imageFile!, fit: BoxFit.cover,),
                    ),
                  ),

                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Episode title*',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  CustomTextFormField(
                    controller: titleController,
                    hint: 'Episode title',
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Podcaste type*',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildDropdownField(
                    context: context,
                    controller: podcastetypeController,
                    hint: 'Podcast type*',
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
                    label: 'Select podcaste type',
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Episode description*',
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
                    hint: 'Write podcast description...',
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Customize cover*',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: CustomElevatedButton(
                      isLoading: isLoading,
                      onPressed: ()async{
                       if(_validateForm()){
                         setState(() {
                           isLoading = true;
                         });
                         String? imageUrl = await _firebaseStorageService.uploadImagePodcast(_imageFile!);
                         DocumentReference docRef = FirebaseFirestore.instance.collection('podcasts').doc();
                         if(imageUrl != null){
                           Podcast podcast = Podcast(
                               id: docRef.id,
                               episodeTitle: titleController.text,
                               podcastType: podcastetypeController.text,
                               podcastDescription: descriptionController.text,
                               imageUrl: imageUrl
                           );
                           await _firestoreService.addPodcast(podcast).then((value){
                             setState(() {
                               isLoading = false;
                             });

                           }).onError((error, stackTrace){
                             if (kDebugMode) {
                               print(error.toString());
                             }
                             setState(() {
                               isLoading = false;
                             });
                           });

                         }
                         titleController.clear();
                         podcastetypeController.clear();
                         descriptionController.clear();
                         _imageFile = null;
                       }
                      },
                      text: 'Publish now',
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

  bool _validateForm(){
    if(titleController.text.isEmpty || podcastetypeController.text.isEmpty || descriptionController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all required fields')));
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
