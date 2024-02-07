import 'dart:convert';

GroupMessage messageFromMap(String str) =>
    GroupMessage.fromMap(json.decode(str));

String messageToMap(GroupMessage data) => json.encode(data.toMap());

class GroupMessage {
  String fromId;
  String toId;
  String sendTime;
  String message;
  GType type;

  GroupMessage({
    required this.fromId,
    required this.toId,
    required this.sendTime,
    required this.message,
    required this.type,
  });

  factory GroupMessage.fromMap(Map<String, dynamic> json) => GroupMessage(
        fromId: json["fromId"],
        toId: json["toId"],
        sendTime: json["sendTime"],
        message: json["message"],
        type: json["type"] == GType.Image.name ? GType.Image : GType.text,
      );

  Map<String, dynamic> toMap() => {
        "fromId": fromId,
        "toId": toId,
        "sendTime": sendTime,
        "message": message,
        "type": type.name,
      };
}

enum GType { text, Image }
