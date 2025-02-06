import 'package:flutter/material.dart';

class JobApplyScreen extends StatefulWidget {
  const JobApplyScreen({super.key});

  @override
  State<JobApplyScreen> createState() => _JobApplyScreenState();
}

class _JobApplyScreenState extends State<JobApplyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close)),
                ),
              ],
            ),
            Spacer(),
            Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue,width: 2),
                      color: Colors.grey.shade100
                    ),
                    child: Icon(Icons.done,size: 30,color: Colors.blue,),
                  ),
                ),
                SizedBox(height: 13,),
                Text('Your application was sent\nto Tangent!',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              ],
            ),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
