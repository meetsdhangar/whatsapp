import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/Widgets/profileWidget.dart';
import 'package:whatsapp/controllers/loginController.dart';
import 'package:whatsapp/model/chatuserModel.dart';
import 'package:whatsapp/model/groupModel.dart';

import '../controllers/homeController.dart';
import '../model/groupMessage.dart';

class AllGroupInformation extends StatelessWidget {
  final Group group;
  const AllGroupInformation({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final logincontroller = Get.find<Logincontroller>();
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
                                image: NetworkImage(group.image),
                                fit: BoxFit.cover),
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      Text(
                        group.groupName,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        " Group ${group.members.length.toString()} Members",
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProfileContainer(
                              Icons.message,
                              "Message",
                              context,
                            ),
                            ProfileContainer(
                                Icons.graphic_eq, "Voice Chat", context),
                            ProfileContainer(
                              Icons.person_add,
                              "Add",
                              context,
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 15, right: 20),
                        title: Text("Add group description"),
                        titleTextStyle:
                            TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      5.heightBox,
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Images",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Icon(Icons.chevron_right)
                          ],
                        ),
                      ),
                      StreamBuilder(
                          stream: homeController.getGroupImages(group),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var data = snapshot.data?.docs;
                              List<GroupMessage> allmessages = [];

                              allmessages = data!
                                  .map((e) => GroupMessage.fromMap(e.data()))
                                  .toList();
                              print(allmessages);

                              List<GroupMessage> imageMessage = [];
                              for (var i in allmessages) {
                                if (i.type == GType.Image) {
                                  imageMessage.add(i);
                                  print(imageMessage);
                                }
                              }
                              if (imageMessage.length > 0) {
                                return Container(
                                  height: 200,
                                  width: double.infinity,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: imageMessage.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(3),
                                          child: Container(
                                            height: 150,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        imageMessage[index]
                                                            .message))),
                                          ),
                                        );
                                      }),
                                );
                              } else {
                                return Container(
                                  height: 30,
                                  child: Text("No images"),
                                );
                              }
                            } else {
                              return Container(
                                height: 30,
                                child: Text("No images"),
                              );
                            }
                          }),
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
                              listtile("Kept Messages", Icons.bookmark),
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
                              listtile("Group Permisssion", Icons.settings),
                            ],
                          )),
                      5.heightBox,
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 15, right: 10),
                        visualDensity: VisualDensity.compact,
                        leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(Icons.supervisor_account,
                                color: Colors.white)),
                        title: Text("Add group to a community"),
                        titleTextStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        subtitle: Text(
                            "Bring members together in topic-bssed groups"),
                        subtitleTextStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      5.heightBox,
                      Column(
                        children: List.generate(
                            group.members.length,
                            (index) => StreamBuilder(
                                stream: homeController
                                    .getSingleUser(group.members[index]),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    var data = snapshot.data!.docs;
                                    List<ChatUser> members = [];

                                    members = data
                                        .map((e) => ChatUser.fromMap(e.data()))
                                        .toList();

                                    var list = [];

                                    for (var i in members) {
                                      if (i.id ==
                                          logincontroller.loginuser.value!.id) {
                                        list.add(i);
                                      }
                                    }

                                    //     for (var i in data) {

                                    //   members.add(i.data());
                                    // }
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          members[0].profile,
                                        ),
                                      ),
                                      title: Text(members[0].id ==
                                              logincontroller
                                                  .loginuser.value!.id
                                          ? "You"
                                          : "${members[0].name}"),
                                      subtitle: Text("${members[0].about}"),
                                    );
                                  }
                                  return Container();
                                })),
                      ),
                      5.heightBox,
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 15, right: 10),
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.block, color: Colors.red),
                        title: Text("Block ${group.groupName}"),
                        titleTextStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 15, right: 10),
                        visualDensity: VisualDensity.compact,
                        leading: Icon(Icons.thumb_down, color: Colors.red),
                        title: Text("Report ${group.groupName}"),
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
