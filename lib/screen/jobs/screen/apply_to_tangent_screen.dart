import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/app_color.dart';
import 'package:investorentrepreneur/widget/outlinegradientbutton.dart';

class ApplyToTangentScreen extends StatefulWidget {
  const ApplyToTangentScreen({super.key});

  @override
  State<ApplyToTangentScreen> createState() => _ApplyToTangentScreenState();
}

class _ApplyToTangentScreenState extends State<ApplyToTangentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text('Apply to tangent'),
                ],
              ),
              SizedBox(height: 15,),
              Text('Please fill out the from to apply'),
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
                child: Center(child: Text('Upload resume')),
              ),
              SizedBox(height: 16,),
              Text('Addition Details'),
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
              GradientOutlinedButton(onPressed: () { },text: 'Discard',),
            ],
          ),
        ),
      ),
    );
  }
}
