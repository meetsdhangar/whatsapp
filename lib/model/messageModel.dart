import 'dart:convert';

Message messageFromMap(String str) => Message.fromMap(json.decode(str));

String messageToMap(Message data) => json.encode(data.toMap());

class Message {
  String fromId;
  String toId;
  String sendTime;
  String read;
  String message;
  Type type;

  Message({
    required this.fromId,
    required this.toId,
    required this.sendTime,
    required this.read,
    required this.message,
    required this.type,
  });

  factory Message.fromMap(Map<String, dynamic> json) => Message(
        fromId: json["fromId"],
        toId: json["toId"],
        sendTime: json["sendTime"],
        read: json["read"],
        message: json["message"],
        type: json["type"] == Type.Image.name ? Type.Image : Type.text,
      );

  Map<String, dynamic> toMap() => {
        "fromId": fromId,
        "toId": toId,
        "sendTime": sendTime,
        "read": read,
        "message": message,
        "type": type.name,
      };
}

enum Type { text, Image }
