import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/Widgets/profileWidget.dart';
import 'package:whatsapp/controllers/loginController.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(Logincontroller());
    TextEditingController nameController =
        TextEditingController(text: logincontroller.loginuser.value!.name);
    TextEditingController aboutController =
        TextEditingController(text: logincontroller.loginuser.value!.about);

    TextEditingController phoneController =
        TextEditingController(text: logincontroller.loginuser.value!.phone);
    return SafeArea(
        child: Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    await logincontroller.pickImage();
                  },
                  child: logincontroller.selectedProfile.value == ''
                      ? Center(
                          child: CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                AssetImage("assets/images/empty_user.jpg"),
                          ),
                        )
                      : Center(
                          child: CircleAvatar(
                            radius: 80,
                            backgroundImage: FileImage(
                                File(logincontroller.selectedProfile.value)),
                          ),
                        ),
                ),
                20.heightBox,
                ProfileWidget(context, nameController, 'Name',
                    logincontroller.loginuser.value?.name, Icons.person),
                // 7.heightBox,
                Divider(thickness: 0.5),
                ProfileWidget(context, aboutController, 'About',
                    logincontroller.loginuser.value?.about, Icons.info_outline),
                //  7.heightBox,
                Divider(thickness: 0.5),
                ProfileWidget(context, phoneController, 'Phone',
                    logincontroller.loginuser.value?.phone, Icons.phone)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
