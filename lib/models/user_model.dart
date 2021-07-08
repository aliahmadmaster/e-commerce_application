import 'dart:convert';

class UserModel {
  String imageUrl;
  bool active;
  String id;
  String email;
  String password;
  String cnic;
  String gender;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  UserModel({
    this.imageUrl,
    this.active,
    this.id,
    this.email,
    this.password,
    this.cnic,
    this.gender,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'active': active,
      'id': id,
      'email': email,
      'password': password,
      'cnic': cnic,
      'gender': gender,
      'name': name,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      imageUrl: map['imageUrl'],
      active: map['active'],
      id: map['id'],
      email: map['email'],
      password: map['password'],
      cnic: map['cnic'],
      gender: map['gender'],
      name: map['name'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
