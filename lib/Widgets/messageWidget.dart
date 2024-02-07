import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/controllers/homeController.dart';
import 'package:whatsapp/model/messageModel.dart';

import '../model/groupMessage.dart';

Widget RecieverMessageWidget(context, Message message) {
  final homecontroller = Get.find<HomeController>();

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
                    children: [
                      Text(homecontroller.getFormatedDate(
                          context: context, time: message.sendTime)),
                      Icon(Icons.check),
                    ],
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
  final homecontroller = Get.find<HomeController>();
  return Align(
    alignment: Alignment.topRight,
    child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        child: ClipPath(
          clipper: UpperNipMessageClipperTwo(MessageType.send),
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.only(top: 10, right: 20, left: 25, bottom: 10),
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
                    children: [
                      Text(homecontroller.getFormatedDate(
                          context: context, time: message.sendTime)),
                      Icon(Icons.check),
                    ],
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

Widget GroupRecieverMessageWidget(context, GroupMessage message) {
  final homecontroller = Get.find<HomeController>();
  return Align(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: const EdgeInsets.only(right: 0, top: 10),
      child: Row(
        children: [
          Container(
            child: Image.network(message.fromId),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(30)),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            child: ClipPath(
              clipper: UpperNipMessageClipperTwo(MessageType.receive),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                padding:
                    EdgeInsets.only(top: 10, right: 10, left: 25, bottom: 10),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    message.type == GType.Image
                        ? Image.network(message.message)
                        : Text(
                            '${message.message}',
                            style: TextStyle(fontSize: 17),
                          ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            homecontroller.getFormatedDate(
                              context: context,
                              time: message.sendTime,
                            ),
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 13),
                          ),
                          Icon(Icons.check),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget GroupSenderMessageWidget(context, GroupMessage message) {
  final homecontroller = Get.find<HomeController>();
  return Align(
    alignment: Alignment.topRight,
    child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        child: ClipPath(
          clipper: UpperNipMessageClipperTwo(MessageType.send),
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.only(top: 10, right: 20, left: 25, bottom: 10),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                message.type == GType.Image
                    ? Image.network(message.message)
                    : Text(
                        '${message.message}',
                        style: TextStyle(fontSize: 17),
                      ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(homecontroller.getFormatedDate(
                          context: context, time: message.sendTime)),
                      Icon(Icons.check),
                    ],
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
