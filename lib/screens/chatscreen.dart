import 'dart:developer';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/Utils/colors.dart';
import 'package:whatsapp/Widgets/chatinput.dart';

import 'package:whatsapp/controllers/homeController.dart';
import 'package:whatsapp/controllers/loginController.dart';
import 'package:whatsapp/model/chatuserModel.dart';
import 'package:whatsapp/model/messageModel.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:whatsapp/Widgets/messageWidget.dart';

class Chatscreen extends StatelessWidget {
  final ChatUser oppUser;
  const Chatscreen({super.key, required this.oppUser});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(Logincontroller());
    final homecontroller = Get.put(HomeController());
    var textController = TextEditingController();
    return Obx(
      // ignore: deprecated_member_use
      () => WillPopScope(
        onWillPop: () {
          homecontroller.enteredMessage.value = '';
          if (homecontroller.showemoji.value) {
            homecontroller.showemoji.value = !homecontroller.showemoji.value;
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 10,
            toolbarHeight: 80,
            backgroundColor: tealDarkGreenColor,
            leadingWidth: 30,
            leading: InkWell(
              onTap: () {
                if (homecontroller.showemoji.value) {
                  homecontroller.showemoji.value =
                      !homecontroller.showemoji.value;
                }
                textController.text = '';
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            title: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(oppUser.profile),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.yellow),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        oppUser.id == logincontroller.loginuser.value?.id
                            ? 'Me'
                            : "${oppUser.name}",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        oppUser.id == logincontroller.loginuser.value?.id
                            ? 'Message Yourself'
                            : oppUser.isActive == true
                                ? 'Online'
                                : homecontroller.getLastSeen(
                                    context: context, time: oppUser.lastSeen),
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              Icon(
                Icons.videocam,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.call,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  height: context.screenHeight,
                  width: context.screenWidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/whatsappbg.png"),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 5, right: 10),
                    child: StreamBuilder(
                      stream: homecontroller.getMessages(oppUser),
                      builder: (context, snapshot) {
                        List<Message> messagelist = [];
                        if (snapshot.hasData) {
                          var data = snapshot.data?.docs;
                          messagelist = data
                                  ?.map((e) => Message.fromMap(e.data()))
                                  .toList() ??
                              [];
                        }
                        return ListView.builder(
                          itemCount: messagelist.length,
                          reverse: true,
                          itemBuilder: (context, index) {
                            var newindex = messagelist.length - 1 - index;
                            if (messagelist[index].fromId ==
                                logincontroller.loginuser.value?.id) {
                              return SenderMessageWidget(
                                  context, messagelist[newindex]);
                            } else {
                              return RecieverMessageWidget(
                                  context, messagelist[newindex]);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              chatInput(textController, context, oppUser),
              homecontroller.showemoji.value == true
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: EmojiPicker(
                        onEmojiSelected: (category, emoji) {
                          log('emoji selected');
                          homecontroller
                              .updateEnteredMessage(textController.text);
                          // homecontroller.enteredMessage.value =
                          //     textController.text;
                        },
                        textEditingController: textController,
                        config: Config(
                          columns: 8,
                          //  bgColor: Color.fromARGB(255, 234, 248, 255),
                          emojiSizeMax: 32 *
                              (foundation.defaultTargetPlatform ==
                                      TargetPlatform.iOS
                                  ? 1.30
                                  : 1.0),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
