import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/chat.dart';
import 'package:whatsapp/controllers/homeController.dart';
import 'package:whatsapp/controllers/loginController.dart';
import 'package:whatsapp/model/chatuserModel.dart';
import 'package:whatsapp/model/messageModel.dart';
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
      () => Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.green,
          leadingWidth: 30,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
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
                height: 60,
                width: 60,
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
              Column(
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
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )
                ],
              ),
            ],
          ),
          actions: [
            Icon(
              Icons.video_call,
              color: Colors.white,
            ),
            SizedBox(
              width: 25,
            ),
            Icon(
              Icons.call,
              color: Colors.white,
            ),
            SizedBox(
              width: 25,
            ),
            Icon(
              Icons.more_vert,
              color: Colors.white,
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
                        fit: BoxFit.cover)),
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
                        itemBuilder: (context, index) {
                          if (messagelist[index].fromId ==
                              logincontroller.loginuser.value?.id) {
                            return SenderMessageWidget(
                                context, messagelist[index]);
                          } else {
                            return RecieverMessageWidget(
                                context, messagelist[index]);
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                      margin: EdgeInsets.only(left: 2, right: 2, bottom: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                        onChanged: (val) {
                          homecontroller.enteredMessage.value = val.toString();
                        },
                        controller: textController,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type a message",
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.emoji_emotions),
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (builder) => bottomsheet());
                                },
                                icon: Icon(Icons.attach_file),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.camera_alt),
                              ),
                            ],
                          ),
                          contentPadding: EdgeInsets.all(5),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, right: 5, left: 5),
                  child: InkWell(
                    onTap: () {
                      if (homecontroller.enteredMessage.value != '') {
                        homecontroller.sendmessage(oppUser,
                            homecontroller.enteredMessage.value, Type.text);

                        textController.text = '';
                      }
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xFF128c7E),
                      child: Icon(
                          color: Colors.white,
                          homecontroller.enteredMessage.value == ''
                              ? Icons.mic
                              : Icons.send),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
