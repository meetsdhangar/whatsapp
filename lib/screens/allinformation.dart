import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/Widgets/profileWidget.dart';
import 'package:whatsapp/controllers/homeController.dart';
import 'package:whatsapp/model/chatuserModel.dart';

class AllInformation extends StatelessWidget {
  final ChatUser user;
  const AllInformation({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Obx(
      () => homeController.obxcheck == true
          ? Scaffold()
          : Scaffold(
              appBar: AppBar(
                toolbarHeight: 30,
                backgroundColor: Colors.white,
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                ],
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width / 3,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(user.profile),
                                fit: BoxFit.cover),
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      Text(
                        user.name,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        user.phone,
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProfileContainer(Icons.message, "Message", context),
                            ProfileContainer(Icons.phone, "Audio", context),
                            ProfileContainer(
                                Icons.video_call, "Video", context),
                            ProfileContainer(
                                Icons.currency_rupee_rounded, "Pay", context)
                          ],
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 15, right: 20),
                        title: Text(user.about),
                        titleTextStyle:
                            TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      5.heightBox,
                      Card(
                          shape: RoundedRectangleBorder(),
                          color: Colors.white,
                          elevation: 0.3,
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding:
                                    EdgeInsets.only(left: 15, right: 5),
                                visualDensity: VisualDensity.compact,
                                leading: Icon(Icons.notifications,
                                    color: Colors.grey.shade600),
                                title: Text("Mute notifications"),
                                titleTextStyle: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                trailing: Switch(
                                  value: homeController.stopNotification.value,
                                  onChanged: (value) {
                                    homeController.stopNotification.value =
                                        value;
                                  },
                                ),
                              ),
                              listtile(
                                  "Custom notifications", Icons.music_note),
                              listtile("Meadia visibility", Icons.image),
                            ],
                          )),
                      5.heightBox,
                      Card(
                          shape: RoundedRectangleBorder(),
                          color: Colors.white,
                          elevation: 0.3,
                          child: Column(
                            children: [
                              listtile("Encryption", Icons.lock),
                              listtile("Disappearing Messages", Icons.update),
                              ListTile(
                                contentPadding:
                                    EdgeInsets.only(left: 15, right: 10),
                                visualDensity: VisualDensity.compact,
                                leading: Icon(Icons.lock,
                                    color: Colors.grey.shade600),
                                title: Text("Chat lock"),
                                titleTextStyle: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                trailing: Switch(
                                  value: homeController.chatlock.value,
                                  onChanged: (value) {
                                    homeController.chatlock.value = value;
                                  },
                                ),
                              ),
                            ],
                          )),
                      5.heightBox,
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 15, right: 10),
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.block, color: Colors.red),
                        title: Text("Block ${user.name}"),
                        titleTextStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 15, right: 10),
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.thumb_down, color: Colors.red),
                        title: Text("Report ${user.name}"),
                        titleTextStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
