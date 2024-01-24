import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:whatsapp/controllers/loginController.dart';
import 'package:whatsapp/model/chatuserModel.dart';
import 'package:whatsapp/model/messageModel.dart';

class HomeController extends GetxController {
  final logincontroller = Get.put(Logincontroller());

  RxString enteredMessage = ''.obs;

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
    final oppid = oppuser.id.hashCode;
    final uid = logincontroller.loginuser.value?.id.hashCode;
    if (uid != null) {
      return oppid <= uid ? '${oppid}_${uid}' : '${uid}_${oppid}';
    }
    return null;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(oppUser) {
    return logincontroller.firestore
        .collection('chats/${generateChatId(oppUser)}/messages/')
        .snapshots();
  }
}
