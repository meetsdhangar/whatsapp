// To parse this JSON data, do
//
//     final home = homeFromMap(jsonString);

import 'dart:convert';

Home homeFromMap(String str) => Home.fromMap(json.decode(str));

String homeToMap(Home data) => json.encode(data.toMap());

class Home {
  String heyThereIAmUsingWhatsapp;
  bool isActive;
  String jay;
  String lastSeen;
  String phone;
  String profile;
  String about;
  String name;
  String createdAt;
  String id;

  Home({
    required this.heyThereIAmUsingWhatsapp,
    required this.isActive,
    required this.jay,
    required this.lastSeen,
    required this.phone,
    required this.profile,
    required this.about,
    required this.name,
    required this.createdAt,
    required this.id,
  });

  factory Home.fromMap(Map<String, dynamic> json) => Home(
        heyThereIAmUsingWhatsapp: json["Hey there, I am using whatsapp"],
        isActive: json["is_active"],
        jay: json["jay"],
        lastSeen: json["last_seen"],
        phone: json["phone"],
        profile: json["profile"],
        about: json["about"],
        name: json["name"],
        createdAt: json["created_at"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "Hey there, I am using whatsapp": heyThereIAmUsingWhatsapp,
        "is_active": isActive,
        "jay": jay,
        "last_seen": lastSeen,
        "phone": phone,
        "profile": profile,
        "about": about,
        "name": name,
        "created_at": createdAt,
        "id": id,
      };
}
