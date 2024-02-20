import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/controllers/homeController.dart';
import 'package:whatsapp/controllers/loginController.dart';
import 'package:whatsapp/model/chatuserModel.dart';

import 'package:whatsapp/screens/allinformation.dart';
import 'package:whatsapp/screens/chatscreen.dart';

import '../Utils/colors.dart';

class Homeprectice extends StatelessWidget {
  const Homeprectice({super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(Logincontroller());
    final homecontroller = Get.put(HomeController());
    return SafeArea(
        child: Obx(
      () => homecontroller.obxcheck.value
          ? Scaffold()
          : Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    StreamBuilder(
                      stream: logincontroller.firestore
                          .collection('users')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<ChatUser> users = [];
                          final data = snapshot.data?.docs;
                          users = data
                                  ?.map((e) => ChatUser.fromMap(e.data()))
                                  .toList() ??
                              [];
                          print("users{$users}");
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(),
                                            contentPadding: EdgeInsets.zero,
                                            content: Container(
                                              height: 300,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                      child: Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                users[index]
                                                                    .profile))),
                                                  )),
                                                  Container(
                                                    height: 50,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    color: Colors.white,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Get.off(() =>
                                                                Chatscreen(
                                                                    oppUser: users[
                                                                        index]));
                                                          },
                                                          child: Icon(
                                                            Icons.message,
                                                            color: greenLight,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.call,
                                                          color: greenLight,
                                                        ),
                                                        Icon(
                                                          Icons.video_call,
                                                          color: greenLight,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Get.off(() =>
                                                                AllInformation(
                                                                    user: users[
                                                                        index]));
                                                          },
                                                          child: Icon(
                                                            Icons.info_rounded,
                                                            color: greenLight,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        NetworkImage(users[index].profile),
                                  ),
                                ),
                                title: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Chatscreen(
                                        oppUser: users[index],
                                      ),
                                    ));
                                  },
                                  child: Text(
                                    users[index].id ==
                                            logincontroller.loginuser.value!.id
                                        ? "Me"
                                        : users[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                                subtitle: Row(
                                  children: [
                                    Icon(Icons.done_all),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(child: Text(users[index].about)),
                                  ],
                                ),
                                trailing: Text(
                                  homecontroller.getFormatedDate(
                                      context: context,
                                      time: logincontroller
                                          .loginuser.value!.lastSeen),
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
    ));
  }
}
