import 'package:investorentrepreneur/common/app_images.dart';

class DashboardModel{
  String image;
  String title;
  DashboardModel({required this.image, required this.title});
}

List<DashboardModel> dashboardData = [
  DashboardModel(image: DashboardImage.videosImage, title: 'Videos'),
  DashboardModel(image: DashboardImage.podcastImage, title: 'Podcasts'),
  DashboardModel(image: DashboardImage.eventsImage, title: 'Events'),
  DashboardModel(image: DashboardImage.jobsImage, title: 'Jobs'),
  DashboardModel(image: DashboardImage.profileImage, title: 'Profile'),
];