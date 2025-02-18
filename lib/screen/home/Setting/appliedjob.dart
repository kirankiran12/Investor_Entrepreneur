import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/screen/jobs/model/jobsModel.dart';
import 'package:investorentrepreneur/screen/jobs/screen/apply_to_tangent_screen.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';

class Appliedjob extends StatefulWidget {
  const Appliedjob({super.key});

  @override
  State<Appliedjob> createState() => _AppliedjobState();
}

class _AppliedjobState extends State<Appliedjob> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {   
    double screenWidth = MediaQuery.of(context).size.width;
 
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
           children: [
             Row(

                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios,
                            size: screenWidth * 0.07, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CustomText(
                        text: "Applied job",
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                      ),

                    ],
                  ),
              SizedBox(height: 20,),
               Expanded(child: _buildJobGrid()),
           ] ),
        ),
        ),
      );
    
  }

  Widget _buildJobGrid() {
    final jobs = getJobsByCategory(_selectedTab);

    return GridView.builder(
      itemCount: jobs.length,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return jobContainer(jobs[index]);
      },
    );
  }

  Widget jobContainer(JobModel job) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.8)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              backgroundColor: Colors.red,
              radius: 20,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(job.title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(job.datePosted),
          ),
          Text(job.location),
          Text(job.salary),
          Center(
            child: GestureDetector(
              onTap: () {
                _showBottomSheet(
                  title: job.title,
                  location: job.location,
                  salary: job.salary,
                  datePosted: job.datePosted,
                  company: job.company,
                  jobType: job.jobType,
                );
              },
              child: Container(
                height: 44,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Apply Now',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet({
    required String title,
    required String location,
    required String salary,
    required String datePosted,
    required String company,
    required String jobType,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Job Details'),
                const SizedBox(height: 20),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(title),
                          const Icon(Icons.bookmark_outline_sharp),
                        ],
                      ),
                      const SizedBox(height: 15),
                      CustomElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ApplyToTangentScreen(),
                            ),
                          );
                        },
                        text: 'Apply Now',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
