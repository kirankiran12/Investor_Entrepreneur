class Event {
  String? id;
  final String title;
  final String eventType;
  final String date;
  final String startTime;
  final String endTime;
  final String description;
  final String eventCategory;
  final String selectLocation;
  final String writeLocation;
  final String eventFormat;
  final String networkingOpportunities;
  final String ticketType;
  final String eventDuration;
  final String numberOfPeopleAttended;
  final String imageUrl;

  Event({
    this.id,
    required this.title,
    required this.eventType,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.eventCategory,
    required this.selectLocation,
    required this.writeLocation,
    required this.eventFormat,
    required this.networkingOpportunities,
    required this.ticketType,
    required this.eventDuration,
    required this.numberOfPeopleAttended,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'eventType': eventType,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
      'eventCategory': eventCategory,
      'selectLocation': selectLocation,
      'writeLocation': writeLocation,
      'eventFormat': eventFormat,
      'networkingOpportunities': networkingOpportunities,
      'ticketType': ticketType,
      'eventDuration': eventDuration,
      'numberOfPeopleAttended': numberOfPeopleAttended,
      'imageUrl': imageUrl,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map, String id) {
    return Event(
      id: id,
      title: map['title'],
      eventType: map['eventType'],
      date: map['date'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      description: map['description'],
      eventCategory: map['eventCategory'],
      selectLocation: map['selectLocation'],
      writeLocation: map['writeLocation'],
      eventFormat: map['eventFormat'],
      networkingOpportunities: map['networkingOpportunities'],
      ticketType: map['ticketType'],
      eventDuration: map['eventDuration'],
      numberOfPeopleAttended: map['numberOfPeopleAttended'],
      imageUrl: map['imageUrl'],
    );
  }
}