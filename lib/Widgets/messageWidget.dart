import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/model/messageModel.dart';

Widget RecieverMessageWidget(context, Message message) {
  return Align(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: const EdgeInsets.only(right: 0, top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        child: ClipPath(
          clipper: UpperNipMessageClipperTwo(MessageType.receive),
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.only(top: 10, right: 10, left: 25, bottom: 10),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                message.type == Type.Image
                    ? Image.network(message.message)
                    : Text(
                        '${message.message}',
                        style: TextStyle(fontSize: 17),
                      ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Icons.check), Text("time")],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget SenderMessageWidget(context, Message message) {
  return Align(
    alignment: Alignment.topRight,
    child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        child: ClipPath(
          clipper: UpperNipMessageClipperTwo(MessageType.send),
          child: Container(
            padding: EdgeInsets.only(top: 10, right: 25, left: 10, bottom: 10),
            decoration: BoxDecoration(color: Colors.white),
            child: message.type == Type.Image
                ? Image.network(message.message)
                : Text(
                    '${message.message}',
                    style: TextStyle(fontSize: 17),
                  ),
          ),
        ),
      ),
    ),
  );
}
