import 'package:flutter/material.dart';

class Notificationscreen extends StatefulWidget {
  const Notificationscreen({super.key});

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
  int _selectedTab = 0;
  final List<String> _tabs = ["All", "Live", "Job Related", "Event"];

  final List<Map<String, String>> _notifications = [
    {
      'message': 'You successfully bought a ticket for the event.',
      'time': '5 min ago',
      'image': 'assets/images/profile.jpeg',
      'type': 'Event',
    },
    {
      'message': 'Your ticket has been confirmed. Continue gaining ticket.',
      'time': '10 min ago',
      'image': 'assets/images/profileimage2.jpeg',
      'type': 'Job Related',
    },
    {
      'message': 'Event details updated, check now.',
      'time': '15 min ago',
      'image': 'assets/images/men.jpeg',
      'type': 'Event',
    },
    {
      'message': 'Your payment has been processed.',
      'time': '20 min ago',
      'image': 'assets/images/host.jpeg',
      'type': 'Live',
    },
    {
      'message': 'Your ticket has been confirmed. Continue gaining ticket.',
      'time': '10 min ago',
      'image': 'assets/images/profileimage2.jpeg',
      'type': 'Job Related',
    },
    {
      'message': 'You successfully bought a ticket for the event.',
      'time': '5 min ago',
      'image': 'assets/images/profile.jpeg',
      'type': 'Event',
    },
     {
      'message': 'Event details updated, check now.',
      'time': '15 min ago',
      'image': 'assets/images/men.jpeg',
      'type': 'Event',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildHeader(context),
              const SizedBox(height: 20),
              _buildTabBar(),
              const SizedBox(height: 20),
              Expanded(
                child: _buildNotificationsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        const Text(
          "Notification",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(_tabs.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTab = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: _selectedTab == index
                    ? const LinearGradient(colors: [
                        Colors.blue,
                        Colors.purple,
                        Colors.red,
                        Colors.orange
                      ])
                    : null,
                color: _selectedTab == index ? null : Colors.grey[300],
              ),
              child: Row(
                children: [
                  Text(
                    _tabs[index],
                    style: TextStyle(
                      color:
                          _selectedTab == index ? Colors.white : Colors.black,
                    ),
                  ),
                  if (index != 0)
                    Icon(Icons.arrow_drop_down,
                        color: _selectedTab == index
                            ? Colors.white
                            : Colors.black),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildNotificationsList() {
    List<Map<String, String>> filteredNotifications = _selectedTab == 0
        ? _notifications
        : _notifications
            .where(
                (notification) => notification['type'] == _tabs[_selectedTab])
            .toList();

    return ListView.builder(
      itemCount: filteredNotifications.length,
      itemBuilder: (context, index) {
        final notification = filteredNotifications[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(notification['image']!),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: notification['message']!,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              WidgetSpan(
                                child: GestureDetector(
                                  onTap: () {
                                    print("Read More Clicked!");
                                  },
                                  child: Text(
                                    'view more',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        notification['time']!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      PopupMenuButton<String>(
                        color: Colors.white,
                        icon: const Icon(Icons.more_vert, color: Colors.black),
                        onSelected: (value) {
                          if (value == 'Hide') {
                          } else if (value == 'Details') {
                          } else if (value == 'Report') {
                          } else if (value == 'Delete') {}
                        },
                        itemBuilder: (BuildContext context) {
                          return ['Hide', 'Details', 'Report', 'Delete']
                              .map((option) => PopupMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  ))
                              .toList();
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(height: 20, thickness: 1, color: Colors.grey),
            ],
          ),
        );
      },
    );
  }
}
