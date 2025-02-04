import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/screen/home/filter/screen/filterscreen.dart';
import 'package:investorentrepreneur/screen/home/mapscreen/map.dart';
import 'package:investorentrepreneur/widget/custom_textformfield.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Jobs",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Mapscreen()),
                      );
                      Icon(Icons.location_on_rounded);
                    },
                    icon: Icon(Icons.location_on_rounded),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[200],
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const  Filterscreen()),
                        );
                      },
                      icon: Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              CustomTextFormField(
                hint: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
