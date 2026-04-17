import 'dart:convert';

class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String company;
  final String website;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.company,
    required this.website,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      company: json['company']['name'],
      website: json['website'],
    );
  }
}
