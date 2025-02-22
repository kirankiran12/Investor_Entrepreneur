import 'package:flutter/material.dart';
import 'package:investorentrepreneur/common/customtext.dart';
import 'package:investorentrepreneur/screen/home/filter/screen/filterscreen.dart';
import 'package:investorentrepreneur/screen/home/mapscreen/map.dart';
import 'package:investorentrepreneur/screen/jobs/model/interestJobModel.dart';
import 'package:investorentrepreneur/screen/jobs/model/jobsModel.dart';
import 'package:investorentrepreneur/screen/jobs/screen/apply_to_tangent_screen.dart';
import 'package:investorentrepreneur/screen/jobs/screen/job_filter_screen.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
import 'package:investorentrepreneur/widget/custom_textformfield.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});
  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  final List<String> _tabs = ["All", "Category", "Location", "Date"];
  int _selectedTab = 0;
  bool _isJobsExpanded = false;
  bool _isInterestExpanded = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_isJobsExpanded || _isInterestExpanded)
                    InkWell(
                        onTap: () {
                          setState(() {
                            _isJobsExpanded = false;
                            _isInterestExpanded = false;
                          });
                        },
                        child: Icon(Icons.arrow_back_ios_new)),
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
                              builder: (context) => const JobFilterScreen()),
                        );
                      },
                      icon: Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                hint: 'Search',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 50,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(_tabs.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: _selectedTab == index
                                  ? LinearGradient(colors: [
                                      Colors.blue,
                                      Colors.purple,
                                      Colors.red,
                                      Colors.orange
                                    ])
                                  : null,
                              color: _selectedTab == index
                                  ? null
                                  : Colors.grey[300],
                            ),
                            child: Row(
                              children: [
                                Text(
                                  _tabs[index],
                                  style: TextStyle(
                                    color: _selectedTab == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                if (index != 0)
                                  Icon(Icons.arrow_drop_down,
                                      color: Colors.black),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 8),
              if (!_isInterestExpanded) // Hide "Jobs" section if "Related to your interest" is expanded
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Jobs',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isJobsExpanded = !_isJobsExpanded;
                              _isInterestExpanded =
                                  false; // Hide interest section
                            });
                          },
                          child: Text(
                            _isJobsExpanded ? '' : 'See all',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: _isJobsExpanded ? null : 205,
                      child: _isJobsExpanded
                          ? GridView.builder(
                              itemCount: getJobsByCategory(_selectedTab).length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.75,
                              ),
                              itemBuilder: (context, index) {
                                return jobContainer(
                                    getJobsByCategory(_selectedTab)[index]);
                              },
                            )
                          : ListView.builder(
                              itemCount: getJobsByCategory(_selectedTab).length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return jobContainer(
                                    getJobsByCategory(_selectedTab)[index]);
                              },
                            ),
                    ),
                  ],
                ),
              if (!_isJobsExpanded) // Hide "Related to your interest" section if "Jobs" is expanded
                Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Related to your interest',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isInterestExpanded = !_isInterestExpanded;
                              _isJobsExpanded = false; // Hide jobs section
                            });
                          },
                          child: Text(
                            _isInterestExpanded ? '' : 'See all',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: _isInterestExpanded ? null : 205,
                      child: _isInterestExpanded
                          ? GridView.builder(
                              itemCount:
                                  getRelatedJobsByCategory(_selectedTab).length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.75,
                              ),
                              itemBuilder: (context, index) {
                                return relatedJobContainer(
                                    getRelatedJobsByCategory(
                                        _selectedTab)[index]);
                              },
                            )
                          : ListView.builder(
                              itemCount:
                                  getRelatedJobsByCategory(_selectedTab).length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return relatedJobContainer(
                                    getRelatedJobsByCategory(
                                        _selectedTab)[index]);
                              },
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

  Widget jobContainer(JobModel job) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withAlpha((0.8 * 255).toInt())),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 20,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title:
                Text(job.title, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(job.datePosted),
          ),
          Text(job.location),
          Text(job.salary),
          // SizedBox(height: (_isJobsExpanded || _isInterestExpanded) ? 10 : 25),
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
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  'Apply Now',
                  style: TextStyle(color: Colors.blue),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget relatedJobContainer(InterestJobModel job) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withAlpha((0.8 * 255).toInt())),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 20,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title:
                Text(job.title, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(job.datePosted),
          ),
          Text(job.location),
          Text(job.salary),
          // SizedBox(height: (_isJobsExpanded || _isInterestExpanded) ? 10 : 15),
          Expanded(
            child: Center(
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
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text('Apply Now',
                          style: TextStyle(color: Colors.blue))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(
      {required String title,
      required String location,
      required String salary,
      required String datePosted,
      required String company,
      required String jobType}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Isse bottom sheet ko full width milegi
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width, // Full screen width
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Center(
                      child: Text(
                    '               Job Details',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        // margin: EdgeInsets.only(left: 100),
                        child: PopupMenuButton(
                          icon: Icon(
                            Icons.more_vert,
                            size: 20,
                            color: Colors.black,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.white,
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                value: 'edit',
                                child: Row(
                                  children: [
                                    Icon(Icons.edit, color: Colors.black),
                                    SizedBox(width: 10),
                                    Text('Edit'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 'delete',
                                child: Row(
                                  children: [
                                    Icon(Icons.delete, color: Colors.red),
                                    SizedBox(width: 10),
                                    Text('Delete'),
                                  ],
                                ),
                              ),
                            ];
                          },
                          onSelected: (value) {
                            if (value == 'edit') {
                              print('Edit selected');
                            } else if (value == 'delete') {
                              print('Delete selected');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Marketing head'),
                        Icon(Icons.bookmark_outline_sharp),
                      ],
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 20,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text('job.title',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('job.datePosted'),
                    ),
                    Text('3 week ago'),
                    customRowWidget(
                        icon: Icons.shopping_bag_outlined, title: title),
                    customRowWidget(
                        icon: Icons.watch_outlined, title: location),
                    customRowWidget(icon: Icons.light, title: salary),
                    customRowWidget(
                        icon: Icons.safety_check, title: datePosted),
                    customRowWidget(
                        icon: Icons.shopping_bag_outlined, title: company),
                    customRowWidget(
                        icon: Icons.shopping_bag_outlined, title: jobType),
                    SizedBox(
                      height: 15,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ApplyToTangentScreen(),
                            ));
                      },
                      text: 'Apply Now',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget customRowWidget({required String title, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon),
          SizedBox(
            width: 12,
          ),
          Flexible(child: Text(title)),
        ],
      ),
    );
  }
}
