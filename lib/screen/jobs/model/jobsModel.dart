class JobModel {
  final String title;
  final String location;
  final String salary;
  final String datePosted;
  final String company;
  final String jobType;

  JobModel({
    required this.title,
    required this.location,
    required this.salary,
    required this.datePosted,
    required this.company,
    required this.jobType,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      salary: json['salary'] ?? '',
      datePosted: json['datePosted'] ?? '',
      company: json['company'] ?? '',
      jobType: json['jobType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'location': location,
      'salary': salary,
      'datePosted': datePosted,
      'company': company,
      'jobType': jobType,
    };
  }
}

List<JobModel> allJobs = [
  JobModel(
    title: 'Machine Learning',
    location: 'Dubai, UAE',
    salary: 'AED 20,000 - 30,000',
    datePosted: '1 week ago',
    company: 'Data Analytics Ltd.',
    jobType: 'Full-time',
  ),
  JobModel(
    title: 'Web Designer',
    location: 'Sharjah, UAE',
    salary: 'AED 11,000 - 16,000',
    datePosted: '5 days ago',
    company: 'Creative Minds Studio',
    jobType: 'Contract',
  ),
  JobModel(
    title: 'Web Developer',
    location: 'Sharjah, UAE',
    salary: 'AED 10,000 - 14,000',
    datePosted: '4 days ago',
    company: 'Design Agency',
    jobType: 'Remote',
  ),
  JobModel(
    title: 'Recruitment Specialist',
    location: 'Dubai, UAE',
    salary: 'AED 16,000 - 22,000',
    datePosted: '8 days ago',
    company: 'People Solutions',
    jobType: 'Full-time',
  ),
  JobModel(
    title: 'Sales Manager',
    location: 'Dubai, UAE',
    salary: 'AED 18,000 - 25,000',
    datePosted: '8 days ago',
    company: 'Sales Pros',
    jobType: 'Full-time',
  ),
  JobModel(
    title: 'Product Manager',
    location: 'Abu Dhabi, UAE',
    salary: 'AED 18,000 - 22,000',
    datePosted: '2 weeks ago',
    company: 'Tech Innovations',
    jobType: 'Part-time',
  ),
  JobModel(
    title: 'Help Desk Technician',
    location: 'Abu Dhabi, UAE',
    salary: 'AED 8,000 - 12,000',
    datePosted: 'Yesterday',
    company: 'Tech Support Group',
    jobType: 'Remote',
  ),
  JobModel(
    title: 'IT Support Specialist',
    location: 'Abu Dhabi, UAE',
    salary: 'AED 8,000 - 12,000',
    datePosted: 'Yesterday',
    company: 'Tech Support Group',
    jobType: 'Remote',
  ),
  JobModel(
    title: 'Mobile Developer',
    location: 'Dubai, UAE',
    salary: 'AED 15,000 - 20,000',
    datePosted: '1 week ago',
    company: 'Innovative Solutions',
    jobType: 'Full-time',
  ),
];

List<JobModel> categoryJobs = [
  JobModel(
    title: 'Machine Learning',
    location: 'Dubai, UAE',
    salary: 'AED 20,000 - 30,000',
    datePosted: '1 week ago',
    company: 'Data Analytics Ltd.',
    jobType: 'Full-time',
  ),
  JobModel(
    title: 'Web Designer',
    location: 'Sharjah, UAE',
    salary: 'AED 11,000 - 16,000',
    datePosted: '5 days ago',
    company: 'Creative Minds Studio',
    jobType: 'Contract',
  ),
  JobModel(
    title: 'Web Developer',
    location: 'Sharjah, UAE',
    salary: 'AED 10,000 - 14,000',
    datePosted: '4 days ago',
    company: 'Design Agency',
    jobType: 'Remote',
  ),
];

List<JobModel> locationJobs = [
  JobModel(
    title: 'Recruitment Specialist',
    location: 'Dubai, UAE',
    salary: 'AED 16,000 - 22,000',
    datePosted: '8 days ago',
    company: 'People Solutions',
    jobType: 'Full-time',
  ),
  JobModel(
    title: 'Sales Manager',
    location: 'Dubai, UAE',
    salary: 'AED 18,000 - 25,000',
    datePosted: '8 days ago',
    company: 'Sales Pros',
    jobType: 'Full-time',
  ),
  JobModel(
    title: 'Product Manager',
    location: 'Abu Dhabi, UAE',
    salary: 'AED 18,000 - 22,000',
    datePosted: '2 weeks ago',
    company: 'Tech Innovations',
    jobType: 'Part-time',
  ),

];

List<JobModel> dateJobs = [
  JobModel(
    title: 'Help Desk Technician',
    location: 'Abu Dhabi, UAE',
    salary: 'AED 8,000 - 12,000',
    datePosted: 'Yesterday',
    company: 'Tech Support Group',
    jobType: 'Remote',
  ),
  JobModel(
    title: 'IT Support Specialist',
    location: 'Abu Dhabi, UAE',
    salary: 'AED 8,000 - 12,000',
    datePosted: 'Yesterday',
    company: 'Tech Support Group',
    jobType: 'Remote',
  ),
  JobModel(
    title: 'Mobile Developer',
    location: 'Dubai, UAE',
    salary: 'AED 15,000 - 20,000',
    datePosted: '1 week ago',
    company: 'Innovative Solutions',
    jobType: 'Full-time',
  ),
];


List<JobModel> getJobsByCategory(int selectedIndex) {
  switch (selectedIndex) {
    case 0:
      return allJobs;
    case 1:
      return categoryJobs;
    case 2:
      return locationJobs;
    case 3:
      return dateJobs;
    default:
      return allJobs;
  }
}
