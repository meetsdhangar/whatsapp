import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:whatsapp/controllers/loginController.dart';

import 'package:whatsapp/model/groupModel.dart';

import 'package:whatsapp/screens/groupChat.dart';

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
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(groups[index].image),
                        ),
                        title: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  GroupChat(groupUser: groups[index]),
                            ));
                          },
                          child: Text(
                            groups[index].groupName,
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
                            // Expanded(child: Text(groups[index].groupId)),
                          ],
                        ),
                      );
                    });
              } else {
                return ListTile(
                  title: Text('no data'),
                );
              }
            }),
      ],
    ),
  );
}
