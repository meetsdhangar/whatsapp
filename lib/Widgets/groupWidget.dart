import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Utils/colors.dart';

import 'package:whatsapp/controllers/loginController.dart';

import 'package:whatsapp/model/groupModel.dart';
import 'package:whatsapp/screens/allGroupinformation.dart';

import 'package:whatsapp/screens/groupChat.dart';
import 'package:whatsapp/screens/profileScreen.dart';

Widget GroupWidget() {
  final logincontroller = Get.find<Logincontroller>();

  return SingleChildScrollView(
    child: Column(
      children: [
        StreamBuilder(
            stream: logincontroller.firestore.collection('groups').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Group> groups = [];

                var totaldata = snapshot.data?.docs;

                groups = totaldata!
                        .map(
                          (e) => Group.fromMap(e.data()),
                        )
                        .toList() ??
                    [];

                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: groups.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                GroupChat(groupUser: groups[index]),
                          ));
                        },
                        child: ListTile(
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
                                                          groups[index]
                                                              .image))),
                                            )),
                                            Container(
                                              height: 50,
                                              width: double.infinity,
                                              color: Colors.white,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Get.off(() => GroupChat(
                                                          groupUser:
                                                              groups[index]));
                                                    },
                                                    child: InkWell(
                                                      onTap: () {
                                                        Get.off(() => GroupChat(
                                                            groupUser:
                                                                groups[index]));
                                                      },
                                                      child: Icon(
                                                        Icons.message,
                                                        color: greenLight,
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.graphic_eq,
                                                    color: greenLight,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.off(() =>
                                                          AllGroupInformation(
                                                              group: groups[
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
                                  NetworkImage(groups[index].image),
                            ),
                          ),
                          title: Text(
                            groups[index].groupName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          subtitle: Row(
                            children: [
                              Icon(Icons.done_all),
                              SizedBox(
                                width: 4,
                              ),
                              // Expanded(child: Text(groups[index].groupId)),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    ),
  );
}
