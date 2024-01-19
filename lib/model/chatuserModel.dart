// To parse this JSON data, do
//
//     final chatUser = chatUserFromMap(jsonString);

import 'dart:convert';

ChatUser chatUserFromMap(String str) => ChatUser.fromMap(json.decode(str));

String chatUserToMap(ChatUser data) => json.encode(data.toMap());

class ChatUser {
  bool isActive;
  String lastSeen;
  String phone;
  String profile;
  String about;
  String name;
  String createdAt;
  String id;

  ChatUser({
    required this.isActive,
    required this.lastSeen,
    required this.phone,
    required this.profile,
    required this.about,
    required this.name,
    required this.createdAt,
    required this.id,
  });

  factory ChatUser.fromMap(Map<String, dynamic> json) => ChatUser(
        isActive: json["is_active"],
        lastSeen: json["last_seen"],
        phone: json["phone"],
        profile: json["profile"],
        about: json["about"],
        name: json["name"],
        createdAt: json["created_at"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "is_active": isActive,
        "last_seen": lastSeen,
        "phone": phone,
        "profile": profile,
        "about": about,
        "name": name,
        "created_at": createdAt,
        "id": id,
      };
}
