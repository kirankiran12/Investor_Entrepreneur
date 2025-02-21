import 'dart:convert';

class Job {
  String? id;
  final String jobtitle;
  final String workplace;
  final String jobshift;
  final String experience;
  final String salary;
  final String traveltime;
  final String language;
  final String location;
  final String jobtype;
  final String selectLocation;
  final String writeLocation;
  final String description;

  Job({
    this.id,
    required this.jobtitle,
    required this.workplace,
    required this.jobshift,
    required this.experience,
    required this.salary,
    required this.traveltime,
    required this.language,
    required this.location,
    required this.jobtype,
    required this.selectLocation,
    required this.writeLocation,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'jobtitle': jobtitle,
      'workplace': workplace,
      'jobshift': jobshift,
      'experience': experience,
      'salary': salary,
      'traveltime': traveltime,
      'language': language,
      'location': location,
      'jobtype': jobtype,
      'selectLocation': selectLocation,
      'writeLocation': writeLocation,
      'description': description,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map, {String? id}) {
    return Job(
      id: id ?? map['id'],
      jobtitle: map['jobtitle'],
      workplace: map['workplace'],
      jobshift: map['jobshift'],
      experience: map['experience'],
      salary: map['salary'],
      traveltime: map['traveltime'],
      language: map['language'],
      location: map['location'],
      jobtype: map['jobtype'],
      selectLocation: map['selectLocation'],
      writeLocation: map['writeLocation'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) => Job.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Job(id: $id, jobtitle: $jobtitle, workplace: $workplace, jobshift: $jobshift, experience: $experience, salary: $salary, traveltime: $traveltime, language: $language, location: $location, jobtype: $jobtype, selectLocation: $selectLocation, writeLocation: $writeLocation, description: $description)';
  }

  @override
  bool operator ==(covariant Job other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.jobtitle == jobtitle &&
        other.workplace == workplace &&
        other.jobshift == jobshift &&
        other.experience == experience &&
        other.salary == salary &&
        other.traveltime == traveltime &&
        other.language == language &&
        other.location == location &&
        other.jobtype == jobtype &&
        other.selectLocation == selectLocation &&
        other.writeLocation == writeLocation &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        jobtitle.hashCode ^
        workplace.hashCode ^
        jobshift.hashCode ^
        experience.hashCode ^
        salary.hashCode ^
        traveltime.hashCode ^
        language.hashCode ^
        location.hashCode ^
        jobtype.hashCode ^
        selectLocation.hashCode ^
        writeLocation.hashCode ^
        description.hashCode;
  }
}
