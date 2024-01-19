import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:whatsapp/controllers/loginController.dart';
import 'package:whatsapp/model/chatuserModel.dart';
import 'package:whatsapp/screens/screen1.dart';

Widget mychat() {
  final logincontroller = Get.find<Logincontroller>();

  return Column(
    children: [
      Expanded(
        child: StreamBuilder(
            stream: logincontroller.firestore
                .collection('users')
                .where('id',
                    isNotEqualTo: '${logincontroller.loginuser.value?.id}')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ChatUser> users = [];
                final data = snapshot.data?.docs;
                users =
                    data?.map((e) => ChatUser.fromMap(e.data())).toList() ?? [];

                return ListView.builder(
                  //scrollDirection: Axis.horizontal,
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
                                  image:
                                      AssetImage("assets/images/profile1.jpg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(60),
                            ),
                          ),
                          title: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => screen1(),
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
                              Text(users[index].about),
                            ],
                          ),
                          trailing: Text(users[index].lastSeen),
                        ));
                  },
                );
              } else {
                return ScaffoldMessenger(
                    child: Center(
                  child: Text("Loading Data"),
                ));
              }
            }),
      ),
    ],
  );
}
