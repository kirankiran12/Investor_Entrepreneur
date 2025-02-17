import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/app_color.dart';
import 'package:investorentrepreneur/screen/jobs/screen/job_apply_screen.dart';

class ApplyToTangentScreen extends StatefulWidget {
  const ApplyToTangentScreen({super.key});

  @override
  State<ApplyToTangentScreen> createState() => _ApplyToTangentScreenState();
}

class _ApplyToTangentScreenState extends State<ApplyToTangentScreen> {
  String selectedFilterNavBar = "Discard";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 10,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildFilterButtonNavBar("Discard",height: 55,width: double.infinity)),
              SizedBox(width: 10,),
              Expanded(child: _buildFilterButtonNavBar("Apply",height: 55,width: double.infinity,onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => JobApplyScreen(),));
              })),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,size: 18,)),
                  SizedBox(width: 2,),
                  Text('Apply to tangent',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                ],
              ),
              SizedBox(height: 15,),
              Text('Please fill out the from to apply',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
              TextFormField(
                decoration: InputDecoration(
                  label: Text('First name'),
                    labelStyle: TextStyle(fontSize: 13)
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text('Last name'),
                    labelStyle: TextStyle(fontSize: 13)
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text('Phone country code'),
                    labelStyle: TextStyle(fontSize: 13)
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text('Mobile phone number'),
                    labelStyle: TextStyle(fontSize: 13)
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text('Email Address'),
                    labelStyle: TextStyle(fontSize: 13)
                ),
              ),
              SizedBox(height: 16,),
              Text('Upload resume'),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.gryColor.withValues(alpha: (0.8 * 255).toDouble()),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Text('Upload resume',style: TextStyle(color: Colors.blue),)),
              ),
              SizedBox(height: 16,),
              Text('Addition Details',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
              TextFormField(
                decoration: InputDecoration(
                  label: Text('Where do you live?'),
                    labelStyle: TextStyle(fontSize: 13)
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text('How many years of experience do you have with figma?'),
                  labelStyle: TextStyle(fontSize: 13)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildFilterButtonNavBar(String filter,{double? height, double? width, double? borderRadius, VoidCallback? onTap} ) {
    bool isSelected = selectedFilterNavBar == filter;

    return GestureDetector(
      onTap: () {
        onTap?.call();
        setState(() {
          selectedFilterNavBar = filter; // Update UI when a tab is clicked
        });
      },
      child: Container(
        height: 60,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: isSelected
              ? LinearGradient(
            colors: [
              Colors.blue,
              Colors.purple,
              Colors.red,
              Colors.orange
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          color: isSelected ? null : Colors.grey[300],
        ),
        child: Center(
          child: Text(
            filter,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}