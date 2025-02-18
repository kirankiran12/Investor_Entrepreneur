class Podcast {
  String? id;
  final String episodeTitle;
  final String podcastType;
  final String podcastDescription;
  final String imageUrl;

  Podcast({
    this.id,
    required this.episodeTitle,
    required this.podcastType,
    required this.podcastDescription,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'episodeTitle': episodeTitle,
      'podcastType': podcastType,
      'podcastDescription': podcastDescription,
      'imageUrl': imageUrl,
    };
  }

  factory Podcast.fromMap(Map<String, dynamic> map, String id) {
    return Podcast(
      id: id,
      episodeTitle: map['episodeTitle'],
      podcastType: map['podcastType'],
      podcastDescription: map['podcastDescription'],
      imageUrl: map['imageUrl'],
    );
  }
}