import 'package:flutter/material.dart';

class JobFilterScreen extends StatefulWidget {
  const JobFilterScreen({super.key});

  @override
  State<JobFilterScreen> createState() => _JobFilterScreenState();
}

class _JobFilterScreenState extends State<JobFilterScreen> {
  String selectedFilter = "All";
  String selectedFilterNavBar = "Reset Filters";
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
              Expanded(child: _buildFilterButtonNavBar("Reset Filters",height: 55,width: double.infinity)),
              SizedBox(width: 10,),
              Expanded(child: _buildFilterButtonNavBar("Apply Filters",height: 55,width: double.infinity,onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => JobApplyScreen(),));
              })),
            ],
          ),
        ),
      ),
      body:SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
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
                  Text('Filters',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                ],
              ),
              SizedBox(height: 12,),
              Text('Categories',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
              SizedBox(height: 8,),
              Wrap(
                children: [
                  _buildFilterButton('All'),
                  _buildFilterButton('Tech & Investor'),
                  _buildFilterButton('Teamwork'),
                  _buildFilterButton('Tech & Entrepreneurship'),
                  _buildFilterButton('Health care'),
                  _buildFilterButton('Marketing'),
                  _buildFilterButton('Career'),
                  _buildFilterButton('Security'),
                  _buildFilterButton('E-commerce'),
                  _buildFilterButton('Education & Training'),
                  _buildFilterButton('Finance'),
                  _buildFilterButton('Design & Creativity'),
                  _buildFilterButton('Travel & Tourism'),
                  _buildFilterButton('Automobile'),
                  _buildFilterButton('Food & Beverages'),
                  _buildFilterButton('Sports'),
                  _buildFilterButton('Entertainment'),
                  _buildFilterButton('Gaming'),
                  _buildFilterButton('Photography'),
                  _buildFilterButton('Music'),
                  _buildFilterButton('Science & Research'),
                  _buildFilterButton('AI & Machine Learning'),
                  _buildFilterButton('Blockchain'),
                  _buildFilterButton('Cybersecurity'),
                  _buildFilterButton('Fitness'),
                  _buildFilterButton('Pets & Animals'),
                  _buildFilterButton('Parenting'),
                  _buildFilterButton('Lifestyle'),
                  _buildFilterButton('Beauty & Fashion'),
                  _buildFilterButton('DIY & Crafts'),
                  _buildFilterButton('Home Improvement'),
                  _buildFilterButton('Agriculture'),
                  _buildFilterButton('Space & Astronomy'),
                  _buildFilterButton('History'),
                  _buildFilterButton('Psychology'),
                  _buildFilterButton('Legal & Law'),
                  _buildFilterButton('Politics'),
                  _buildFilterButton('Language Learning'),
                  _buildFilterButton('Self Development'),
                  _buildFilterButton('Social Media'),
                  _buildFilterButton('Mental Health'),
                  _buildFilterButton('Philosophy'),
                  _buildFilterButton('Environmental Science'),
                  _buildFilterButton('Volunteer & Charity'),
                  _buildFilterButton('Freelancing'),
                  _buildFilterButton('Remote Work'),
                  _buildFilterButton('Content Writing'),
                  _buildFilterButton('Startups'),
                  _buildFilterButton('Consulting'),
                  _buildFilterButton('Networking'),
                  _buildFilterButton('Innovation'),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildFilterButton(String filter,{double? height, double? width, double? borderRadius} ) {
    bool isSelected = selectedFilter == filter;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter; // Update UI when a tab is clicked
        });
      },
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 30),
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
            color: isSelected ? null : Colors.grey[200],
          ),
          child: Text(
            filter,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
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
