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
    title: 'Software Engineer',
    location: 'Dubai, UAE',
    salary: 'AED 10,000 - 15,000',
    datePosted: '2 days ago',
    company: 'Tech Solutions',
    jobType: 'Full-time',
  ),
  JobModel(
    title: 'Marketing Manager',
    location: 'Abu Dhabi, UAE',
    salary: 'AED 12,000 - 18,000',
    datePosted: '1 week ago',
    company: 'Media House',
    jobType: 'Part-time',
  ),
  JobModel(
    title: 'Graphic Designer',
    location: 'Sharjah, UAE',
    salary: 'AED 8,000 - 12,000',
    datePosted: '3 days ago',
    company: 'Creative Agency',
    jobType: 'Remote',
  ),
];

List<JobModel> categoryJobs = [
  JobModel(
    title: 'Data Scientist',
    location: 'Dubai, UAE',
    salary: 'AED 15,000 - 25,000',
    datePosted: '5 days ago',
    company: 'AI Tech Hub',
    jobType: 'Full-time',
  ),
  JobModel(
    title: 'UI/UX Designer',
    location: 'Sharjah, UAE',
    salary: 'AED 9,000 - 14,000',
    datePosted: '4 days ago',
    company: 'Design Studio',
    jobType: 'Contract',
  ),
];

List<JobModel> locationJobs = [
  JobModel(
    title: 'HR Manager',
    location: 'Dubai, UAE',
    salary: 'AED 14,000 - 20,000',
    datePosted: '6 days ago',
    company: 'Corporate Group',
    jobType: 'Full-time',
  ),
  JobModel(
    title: 'HR Manager',
    location: 'Dubai, UAE',
    salary: 'AED 14,000 - 20,000',
    datePosted: '6 days ago',
    company: 'Corporate Group',
    jobType: 'Full-time',
  ),
];

List<JobModel> dateJobs = [
  JobModel(
    title: 'Customer Support',
    location: 'Abu Dhabi, UAE',
    salary: 'AED 7,000 - 10,000',
    datePosted: 'Today',
    company: 'Support Hub',
    jobType: 'Remote',
  ),
  JobModel(
    title: 'Customer Support',
    location: 'Abu Dhabi, UAE',
    salary: 'AED 7,000 - 10,000',
    datePosted: 'Today',
    company: 'Support Hub',
    jobType: 'Remote',
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
