import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/controllers/loginController.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(Logincontroller());
    return SafeArea(
        child: Obx(
      () => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                50.heightBox,
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Text(
                    "Name",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.person),
                      25.widthBox,
                      Text(
                        "Meet",
                        //   logincontroller.loginuser.value?.name ?? "meet",
                        style: TextStyle(fontSize: 23),
                      ),
                      250.widthBox,
                      Icon(Icons.edit),
                    ],
                  ),
                ),
                12.heightBox,
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 40),
                  child: Text(
                      'This is not Your Username or pin. This Name Will be Visible To Your WhatsApp Contacts.'),
                ),
                30.heightBox,
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Text(
                    "About",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      23.widthBox,
                      Text(
                        logincontroller.loginuser.value?.about ?? '',

                        // 'Jay Shree Ram',

                        style: TextStyle(fontSize: 23),
                      ),
                      120.widthBox,
                      Expanded(child: Icon(Icons.edit)),
                    ],
                  ),
                ),
                30.heightBox,
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Text(
                    "Phone",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.phone),
                      25.widthBox,
                      Text(
                        '+91 6355596602',
                        style: TextStyle(fontSize: 23),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
