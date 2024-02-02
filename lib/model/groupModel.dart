// // To parse this JSON data, do
// //
// //     final group = groupFromMap(jsonString);

// import 'dart:convert';

// Group groupFromMap(String str) => Group.fromMap(json.decode(str));

// String groupToMap(Group data) => json.encode(data.toMap());

// class Group {
//   String groupName;
//   String groupId;
//   List<String> members;
//   String createdAt;
//   List<String> admins;

//   Group({
//     required this.groupName,
//     required this.groupId,
//     required this.members,
//     required this.createdAt,
//     required this.admins,
//   });

//   factory Group.fromMap(Map<String, dynamic> json) => Group(
//         groupName: json["groupName"],
//         groupId: json["groupId"],
//         members: List<String>.from(json["members"].map((x) => x)),
//         createdAt: json["created_at"],
//         admins: List<String>.from(json["admins"].map((x) => x)),
//       );

//   Map<String, dynamic> toMap() => {
//         "groupName": groupName,
//         "groupId": groupId,
//         "members": List<dynamic>.from(members.map((x) => x)),
//         "created_at": createdAt,
//         "admins": List<dynamic>.from(admins.map((x) => x)),
//       };
// }
// To parse this JSON data, do
//
//     final group = groupFromMap(jsonString);

import 'dart:convert';

Group groupFromMap(String str) => Group.fromMap(json.decode(str));

String groupToMap(Group data) => json.encode(data.toMap());

class Group {
  String groupName;
  String groupId;
  List<String> members;
  String createdAt;
  List<String> admins;
  String image;

  Group({
    required this.groupName,
    required this.groupId,
    required this.members,
    required this.createdAt,
    required this.admins,
    required this.image,
  });

  factory Group.fromMap(Map<String, dynamic> json) => Group(
      groupName: json["groupName"],
      groupId: json["groupId"],
      members: List<String>.from(json["members"].map((x) => x)),
      createdAt: json["created_at"],
      admins: List<String>.from(json["admins"].map((x) => x)),
      image: json["image"]);

  Map<String, dynamic> toMap() => {
        "groupName": groupName,
        "groupId": groupId,
        "members": List<dynamic>.from(members.map((x) => x)),
        "created_at": createdAt,
        "admins": List<dynamic>.from(admins.map((x) => x)),
        "image": image
      };
}
