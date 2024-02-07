import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/chat.dart';
import 'package:whatsapp/controllers/homeController.dart';
import 'package:whatsapp/model/groupMessage.dart';
import 'package:whatsapp/model/messageModel.dart';

Widget chatInput(controller, context, oppUser) {
  final homecontroller = Get.find<HomeController>();
  final FocusNode _textFocusNode = FocusNode();
  return Row(
    children: [
      Expanded(
        child: Card(
          margin: EdgeInsets.only(left: 5, right: 2, bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextFormField(
            onTap: () {
              if (homecontroller.showemoji.value) {
                homecontroller.showemoji.value =
                    !homecontroller.showemoji.value;
              }
            },
            onChanged: (val) {
              homecontroller.updateEnteredMessage(val.toString());
              // homecontroller.enteredMessage.value = val.toString();
            },
            focusNode: _textFocusNode,
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            minLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Type a message",
              prefixIcon: IconButton(
                onPressed: () {
                  // FocusScope.of(context).unfocus();
                  homecontroller.showemoji.value =
                      !homecontroller.showemoji.value;
                },
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
                          builder: (builder) => bottomsheet(oppUser));
                    },
                    icon: Icon(Icons.attach_file),
                  ),
                  IconButton(
                    onPressed: () {
                      homecontroller.sendImagesFromCamera(oppUser);
                    },
                    icon: Icon(Icons.camera_alt),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 8, right: 5, left: 5),
        child: InkWell(
          onTap: () {
            if (homecontroller.enteredMessage.value != '') {
              homecontroller.sendmessage(
                  oppUser, homecontroller.enteredMessage.value, Type.text);

              controller.text = '';
              // homecontroller.showemoji.value;
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
  );
}

Widget groupChatInput(controller, context, group) {
  final homecontroller = Get.find<HomeController>();
  final FocusNode _textFocusNode = FocusNode();
  return Row(
    children: [
      Expanded(
        child: Card(
          margin: EdgeInsets.only(left: 5, right: 2, bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextFormField(
            onTap: () {
              if (homecontroller.showemoji.value) {
                homecontroller.showemoji.value =
                    !homecontroller.showemoji.value;
              }
            },
            onChanged: (val) {
              homecontroller.updateEnteredMessage(val.toString());
              // homecontroller.enteredMessage.value = val.toString();
            },
            focusNode: _textFocusNode,
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            minLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Type a message",
              prefixIcon: IconButton(
                onPressed: () {
                  // FocusScope.of(context).unfocus();
                  homecontroller.showemoji.value =
                      !homecontroller.showemoji.value;
                },
                icon: Icon(Icons.emoji_emotions),
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      // showModalBottomSheet(
                      //     backgroundColor: Colors.transparent,
                      //     context: context,
                      //     builder: (builder) => bottomsheet(oppUser));
                    },
                    icon: Icon(Icons.attach_file),
                  ),
                  IconButton(
                    onPressed: () {
                      homecontroller.sendGroupImagesFromCamera(group);
                    },
                    icon: Icon(Icons.camera_alt),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 8, right: 5, left: 5),
        child: InkWell(
          onTap: () {
            if (homecontroller.enteredMessage.value != '') {
              homecontroller.sendGroupMessage(
                  group, homecontroller.enteredMessage.value, GType.text);

              controller.text = '';
              // homecontroller.showemoji.value;
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
  );
}
