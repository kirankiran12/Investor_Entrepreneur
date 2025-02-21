// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfileinfoModel {
  


 String? id;
  final String name;
  final String birth;
  final String email;
  final String phonenumber;
  final String password;

  ProfileinfoModel({
    
    this.id,
    required this.name,
    required this.birth,
    required this.email,
    required this.phonenumber,
    required this.password,
  });
 
  

  ProfileinfoModel copyWith({
    String? id,
    String? name,
    String? birth,
    String? email,
    String? Phonenumber,
    String? Password,
  }) {
    return ProfileinfoModel(
      id: id ?? this.id,
      name: name ?? this.name,
      birth: birth ?? this.birth,
      email: email ?? this.email,
      phonenumber: Phonenumber ?? this.phonenumber,
      password: Password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'birth': birth,
      'email': email,
      'Phonenumber': phonenumber,
      'Password': password,
    };
  }

  factory ProfileinfoModel.fromMap(Map<String, dynamic> map) {
    return ProfileinfoModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] as String,
      birth: map['birth'] as String,
      email: map['email'] as String,
      phonenumber: map['Phonenumber'] as String,
      password: map['Password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileinfoModel.fromJson(String source) => ProfileinfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileinfoModel(id: $id, name: $name, birth: $birth, email: $email, Phonenumber: $phonenumber, Password: $password)';
  }

  @override
  bool operator ==(covariant ProfileinfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.birth == birth &&
      other.email == email &&
      other.phonenumber == phonenumber &&
      other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      birth.hashCode ^
      email.hashCode ^
      phonenumber.hashCode ^
      password.hashCode;
  }
  }
