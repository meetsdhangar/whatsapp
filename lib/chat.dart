import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/controllers/homeController.dart';
import 'package:whatsapp/controllers/loginController.dart';
import 'package:whatsapp/model/messageModel.dart';

class chat1 extends StatelessWidget {
  const chat1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            //ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                          margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextFormField(
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
                                    onPressed: () {},
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
                          ))),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, right: 5, left: 3),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFF128c7E),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.mic),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget chat(context, oppuser) {
  return Container(
    color: Colors.white,
    height: 80,
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
              child: Container(
                  // width: MediaQuery.of(context).size.width - 60,
                  child: Card(
                      margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
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
                                      builder: (builder) =>
                                          bottomsheet(oppuser));
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
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 5, left: 5),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF128c7E),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.mic),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget bottomsheet(oppuser) {
  final controller = Get.put(HomeController());
 
  return Container(
    height: 278,
    width: 400,
    child: Card(
      margin: EdgeInsets.all(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconcreation(
                    Icons.insert_drive_file, Colors.indigo, "Documents", () {}),
                SizedBox(
                  width: 40,
                ),
                iconcreation(Icons.camera_alt, Colors.pink, "Camera", () {
                  Get.back();
                  controller.sendImagesFromCamera(oppuser);
                }),
                SizedBox(
                  width: 40,
                ),
                iconcreation(Icons.insert_photo, Colors.purple, "Gallary", () {
                  Get.back();
                  controller.sendImagesFromGallery(oppuser);
                }),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconcreation(Icons.headset, Colors.orange, "Audio", () {}),
                SizedBox(
                  width: 40,
                ),
                iconcreation(
                    Icons.location_pin, Colors.teal, "Location", () {}),
                SizedBox(
                  width: 40,
                ),
                iconcreation(Icons.person, Colors.blue, "Contact", () {}),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget iconcreation(IconData icon, Color color, String text, ontap) {
  return InkWell(
    onTap: ontap,
    child: Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(
            icon,
            size: 29,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
