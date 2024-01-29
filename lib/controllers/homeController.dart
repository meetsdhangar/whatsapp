 import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/controllers/loginController.dart';
import 'package:whatsapp/model/chatuserModel.dart';
import 'package:whatsapp/model/messageModel.dart';

class HomeController extends GetxController {
  final logincontroller = Get.put(Logincontroller());

  RxString enteredMessage = ''.obs;
  RxString msgImage = ''.obs;

  Future pickGalleryImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    } else {
      msgImage.value = image.path;
      return image.path;
    }
  }

  pickCameraImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    } else {
      msgImage.value = image.path;
      return image.path;
    }
  }

  sendImagesFromGallery(oppuser) {
    pickGalleryImage().then((value) async {
      final time = DateTime.now().millisecondsSinceEpoch.toString();
      logincontroller
          .storeDataInStorage(
              '/chatImages/${logincontroller.loginuser.value?.id}_$time',
              File(msgImage.value))
          .then((image) {
        sendmessage(oppuser, image, Type.Image);
      });
    });
  }

  sendImagesFromCamera(oppuser) {
    pickCameraImage().then((value) async {
      final time = DateTime.now().millisecondsSinceEpoch.toString();
      logincontroller
          .storeDataInStorage(
              '/chatImages/${logincontroller.loginuser.value?.id}_$time',
              File(msgImage.value))
          .then((image) {
        sendmessage(oppuser, image, Type.Image);
      });
    });
  }

  sendmessage(ChatUser oppUser, mymessage, Type type) async {
    var time = DateTime.now().millisecondsSinceEpoch.toString();

    final message = Message(
        fromId: logincontroller.loginuser.value!.id,
        toId: oppUser.id,
        sendTime: time,
        message: mymessage,
        read: '',
        type: type);

    final ref = logincontroller.firestore
        .collection("chats/${generateChatId(oppUser)}/messages/");

    await ref
        .doc(time)
        .set(message.toMap())
        .then((value) => enteredMessage.value == '');
  }

  generateChatId(ChatUser oppuser) {
    //origional id
    final oppositeuser = oppuser.id;
    final user = logincontroller.loginuser.value?.id;
    //hash code
    final oppid = oppuser.id.hashCode;
    final uid = logincontroller.loginuser.value?.id.hashCode;
    if (uid != null) {
      return oppid <= uid
          ? '${oppositeuser}_${user}'
          : '${user}_${oppositeuser}';
    }
    return null;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(oppUser) {
    return logincontroller.firestore
        .collection('chats/${generateChatId(oppUser)}/messages/')
        .snapshots();
  }

  String getFormatedDate(
      {required BuildContext context, required String time}) {
    final date = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    final formattedtime = TimeOfDay.fromDateTime(date).format(context);

    return formattedtime;
  }

  String getLastSeen({required BuildContext context, required String time}) {
    final date = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    final formattedtime = TimeOfDay.fromDateTime(date).format(context);
    final today = DateTime.now();
    if (today.day == date.day &&
        today.month == date.month &&
        today.year == date.year) {
      return 'Last seen today at $formattedtime';
    }

    if (today.difference(date).inHours / 24 == 1) {
      return 'Last seen yesterday at $formattedtime';
    }
    if (today.year == date.year) {
      final dt = 'Last seen on ${date.day} ${getMonth(date)} at $formattedtime';
      return dt;
    }
    final yearly = 'Last seen on ${date.day} ${getMonth(date)} ${date.year}';
    return yearly;
  }

  getMonth(DateTime date) {
    switch (date.month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
    }
    return 'NA';
  }

  //send image in chat
  // Future<String> sendChatImage(ChatUser chatUser, File file) async {
  //   final ext = file.path.split('.').last;

  //   final ref = logincontroller.storage.ref().child(
  //       'images/${generateChatId(chatUser)}/${DateTime.now().millisecondsSinceEpoch}.$ext');

  //   await ref
  //       .putFile(file, SettableMetadata(contentType: 'image/$ext'))
  //       .then((p0) {
  //     log('data transfered: ${p0.bytesTransferred / 1000} kb');
  //   });

  //   return await ref.getDownloadURL();
  // }
}
