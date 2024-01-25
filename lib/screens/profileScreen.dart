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

    return SafeArea(
        child: Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          leading: InkWell(
              onTap: () async {
                if (logincontroller.selectedProfile.value == '') {
                  logincontroller.updateUserData(
                      nameController.text,
                      aboutController.text,
                      logincontroller.loginuser.value!.profile);
                } else {
                  await (logincontroller.storeDataInStorage(
                          'profieImages/${logincontroller.loginuser.value?.phone.toString()}',
                          File(logincontroller.selectedProfile.value)))
                      .then((img) {
                    logincontroller.updateUserData(
                        nameController.text, aboutController.text, img);
                  });
                }
              },
              child: Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: InkWell(
                    onTap: () async {
                      await logincontroller.pickImage();
                    },
                    child: logincontroller.selectedProfile.value == ''
                        ? CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(
                                logincontroller.loginuser.value!.profile),
                          )
                        : CircleAvatar(
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
                ListTile(
                  visualDensity: VisualDensity.compact,
                  leading: Icon(Icons.phone,
                      size: MediaQuery.of(context).size.width * 0.06,
                      color: Colors.grey.shade600),
                  title: Text("Phone"),
                  titleTextStyle:
                      TextStyle(color: Colors.grey.shade600, fontSize: 15),
                  subtitle: Text(
                    logincontroller.loginuser.value!.phone,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
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
