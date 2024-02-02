import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/controllers/homeController.dart';
import 'package:whatsapp/controllers/loginController.dart';
import 'package:whatsapp/screens/homeScreen.dart';

class GroupCreateScreen extends StatelessWidget {
  const GroupCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homecontroller = Get.put(HomeController());
    var textController = TextEditingController();
    final loginController = Get.put(Logincontroller());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  await logincontroller.pickImage();
                },
                child: logincontroller.selectedProfile.value == ''
                    ? CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            AssetImage("assets/images/empty_user.jpg"),
                      )
                    : CircleAvatar(
                        radius: 80,
                        backgroundImage: FileImage(
                            File(logincontroller.selectedProfile.value)),
                      ),
              ),
              TextFormField(
                controller: textController,
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () async {
                    await homecontroller
                        .getFinalGroupList(logincontroller.loginuser.value!.id);
                    if (textController.text != '') {
                      if (loginController.selectedProfile.value == '') {
                        await loginController
                            .assetImageToFile('assets/images/empty_user.jpg')
                            .then((file) {
                          homecontroller.addNewGroup(textController.text, file);
                        });
                      } else {
                        homecontroller.addNewGroup(textController.text,
                            File(loginController.selectedProfile.value));
                      }
                    } else {
                      print("enter name");
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 80,
                    color: Colors.blue,
                    child: Center(
                      child: Text('Submit'),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
