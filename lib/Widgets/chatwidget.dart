import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/controllers/homeController.dart';
import 'package:whatsapp/controllers/loginController.dart';
import 'package:whatsapp/model/chatuserModel.dart';
import 'package:whatsapp/model/groupModel.dart';
import 'package:whatsapp/screens/chatscreen.dart';

Widget Chatwidget() {
  final logincontroller = Get.find<Logincontroller>();
  final homecontroller = Get.put(HomeController());
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
                      return ListTile(
                        title: Text('${groups[index].groupName}'),
                      );
                    });
              } else {
                return ListTile(
                  title: Text('no data'),
                );
              }
            }),
        StreamBuilder(
            stream: logincontroller.firestore
                .collection('users')
                // .where('id',
                //     isNotEqualTo: '${logincontroller.loginuser.value?.id}')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ChatUser> users = [];
                final data = snapshot.data?.docs;
                users =
                    data?.map((e) => ChatUser.fromMap(e.data())).toList() ?? [];

                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(users[index].profile),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        title: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Chatscreen(
                                oppUser: users[index],
                              ),
                            ));
                          },
                          child: Text(
                            users[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
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
                              time: logincontroller.loginuser.value!.lastSeen),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return ScaffoldMessenger(
                    child: Center(
                  child: Text("Loading Data"),
                ));
              }
            }),
      ],
    ),
  );
}
