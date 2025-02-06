class InterestJobModel {
  final String title;
  final String location;
  final String salary;
  final String datePosted;
  final String company;
  final String jobType;
  final String interestCategory; // New field for category of interest

  InterestJobModel({
    required this.title,
    required this.location,
    required this.salary,
    required this.datePosted,
    required this.company,
    required this.jobType,
    required this.interestCategory, // New field
  });

  factory InterestJobModel.fromJson(Map<String, dynamic> json) {
    return InterestJobModel(
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      salary: json['salary'] ?? '',
      datePosted: json['datePosted'] ?? '',
      company: json['company'] ?? '',
      jobType: json['jobType'] ?? '',
      interestCategory: json['interestCategory'] ?? '', // New field
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
      'interestCategory': interestCategory, // New field
    };
  }
}

// New data for each category
List<InterestJobModel> allJobs = [
  InterestJobModel(
    title: 'Machine Learning Engineer',
    location: 'Dubai, UAE',
    salary: 'AED 20,000 - 35,000',
    datePosted: '1 week ago',
    company: 'AI Labs',
    jobType: 'Full-time',
    interestCategory: 'Artificial Intelligence',
  ),
  InterestJobModel(
    title: 'Product Designer',
    location: 'Sharjah, UAE',
    salary: 'AED 12,000 - 18,000',
    datePosted: '5 days ago',
    company: 'Creative Studio',
    jobType: 'Contract',
    interestCategory: 'Design',
  ),
  InterestJobModel(
    title: 'Senior Developer',
    location: 'Abu Dhabi, UAE',
    salary: 'AED 20,000 - 30,000',
    datePosted: '1 week ago',
    company: 'Tech Innovators',
    jobType: 'Full-time',
    interestCategory: 'Software Development',
  ),
  InterestJobModel(
    title: 'Recruitment Specialist',
    location: 'Dubai, UAE',
    salary: 'AED 15,000 - 22,000',
    datePosted: '1 week ago',
    company: 'HR Solutions',
    jobType: 'Full-time',
    interestCategory: 'Human Resources',
  ),
  InterestJobModel(
    title: 'Operations Manager',
    location: 'Dubai, UAE',
    salary: 'AED 20,000 - 40,000',
    datePosted: '3 days ago',
    company: 'Global Enterprises',
    jobType: 'Full-time',
    interestCategory: 'Operations',
  ),
  InterestJobModel(
    title: 'Digital Marketing Lead',
    location: 'Dubai, UAE',
    salary: 'AED 15,000 - 25,000',
    datePosted: '2 weeks ago',
    company: 'Media Solutions',
    jobType: 'Part-time',
    interestCategory: 'Marketing',
  ),
  InterestJobModel(
    title: 'Help Desk Specialist',
    location: 'Abu Dhabi, UAE',
    salary: 'AED 8,000 - 12,000',
    datePosted: 'Today',
    company: 'Support Team',
    jobType: 'Remote',
    interestCategory: 'Customer Service',
  ),
  InterestJobModel(
    title: 'Account Executive',
    location: 'Abu Dhabi, UAE',
    salary: 'AED 10,000 - 15,000',
    datePosted: 'Yesterday',
    company: 'Sales Inc.',
    jobType: 'Remote',
    interestCategory: 'Sales',
  ),
  InterestJobModel(
    title: 'Visual Designer',
    location: 'Dubai, UAE',
    salary: 'AED 10,000 - 15,000',
    datePosted: '1 week ago',
    company: 'Design Works',
    jobType: 'Remote',
    interestCategory: 'Creative',
  ),
];

List<InterestJobModel> categoryJobs = [
  InterestJobModel(
    title: 'Machine Learning Engineer',
    location: 'Dubai, UAE',
    salary: 'AED 20,000 - 35,000',
    datePosted: '1 week ago',
    company: 'AI Labs',
    jobType: 'Full-time',
    interestCategory: 'Artificial Intelligence',
  ),
  InterestJobModel(
    title: 'Product Designer',
    location: 'Sharjah, UAE',
    salary: 'AED 12,000 - 18,000',
    datePosted: '5 days ago',
    company: 'Creative Studio',
    jobType: 'Contract',
    interestCategory: 'Design',
  ),
  InterestJobModel(
    title: 'Senior Developer',
    location: 'Abu Dhabi, UAE',
    salary: 'AED 20,000 - 30,000',
    datePosted: '1 week ago',
    company: 'Tech Innovators',
    jobType: 'Full-time',
    interestCategory: 'Software Development',
  ),

];

List<InterestJobModel> locationJobs = [
  InterestJobModel(
    title: 'Recruitment Specialist',
    location: 'Dubai, UAE',
    salary: 'AED 15,000 - 22,000',
    datePosted: '1 week ago',
    company: 'HR Solutions',
    jobType: 'Full-time',
    interestCategory: 'Human Resources',
  ),
  InterestJobModel(
    title: 'Operations Manager',
    location: 'Dubai, UAE',
    salary: 'AED 20,000 - 40,000',
    datePosted: '3 days ago',
    company: 'Global Enterprises',
    jobType: 'Full-time',
    interestCategory: 'Operations',
  ),
  InterestJobModel(
    title: 'Digital Marketing Lead',
    location: 'Dubai, UAE',
    salary: 'AED 15,000 - 25,000',
    datePosted: '2 weeks ago',
    company: 'Media Solutions',
    jobType: 'Part-time',
    interestCategory: 'Marketing',
  ),

];

List<InterestJobModel> dateJobs = [
  InterestJobModel(
    title: 'Help Desk Specialist',
    location: 'Abu Dhabi, UAE',
    salary: 'AED 8,000 - 12,000',
    datePosted: 'Today',
    company: 'Support Team',
    jobType: 'Remote',
    interestCategory: 'Customer Service',
  ),
  InterestJobModel(
    title: 'Account Executive',
    location: 'Abu Dhabi, UAE',
    salary: 'AED 10,000 - 15,000',
    datePosted: 'Yesterday',
    company: 'Sales Inc.',
    jobType: 'Remote',
    interestCategory: 'Sales',
  ),
  InterestJobModel(
    title: 'Visual Designer',
    location: 'Dubai, UAE',
    salary: 'AED 10,000 - 15,000',
    datePosted: '1 week ago',
    company: 'Design Works',
    jobType: 'Remote',
    interestCategory: 'Creative',
  ),

];


// Function to get jobs by selected category
List<InterestJobModel> getRelatedJobsByCategory(int selectedIndex) {
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
