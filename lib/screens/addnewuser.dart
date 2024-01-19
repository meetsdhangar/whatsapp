import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/controllers/loginController.dart';

class AddNewUserScreen extends StatelessWidget {
  const AddNewUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(Logincontroller());
    var name = TextEditingController();

    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      await loginController.pickImage();
                    },
                    child: loginController.selectedProfile.value == ''
                        ? CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage("assets/images/empty_user.jpg"),
                          )
                        : CircleAvatar(
                            radius: 40,
                            backgroundImage: FileImage(
                                File(loginController.selectedProfile.value)),
                          ),
                  ),
                  10.heightBox,
                  Text("Name"),
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  20.heightBox,
                  InkWell(
                    onTap: () async {
                      if (name.text != '') {
                        if (loginController.selectedProfile.value == '') {
                          await loginController
                              .assetImageToFile('assets/images/empty_user.jpg')
                              .then((file) {
                            loginController.addnewuser(name.text, file);
                          });
                        } else {
                          loginController.addnewuser(name.text,
                              File(loginController.selectedProfile.value));
                        }
                      } else {
                        print("enter name");
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.green),
                      child: Center(
                        child: Text("Next"),
                      ),
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
}
