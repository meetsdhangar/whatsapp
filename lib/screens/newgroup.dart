import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:whatsapp/controllers/loginController.dart';
import 'package:whatsapp/model/chatuserModel.dart';

class NewGroup extends StatelessWidget {
  const NewGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.find<Logincontroller>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55,
        titleSpacing: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff075E54),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New group",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Add members",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Color(0xff075E54), borderRadius: BorderRadius.circular(50)),
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 13),
            child: Text(
              "Contacts on WhatsApp",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
            ),
          ),
          10.heightBox,
          Expanded(
            child: StreamBuilder(
                stream:
                    logincontroller.firestore.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ChatUser> users = [];
                    final data = snapshot.data?.docs;
                    users =
                        data?.map((e) => ChatUser.fromMap(e.data())).toList() ??
                            [];

                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10, left: 0, right: 0),
                          child: ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(users[index].profile),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(60),
                              ),
                            ),
                            title: Text(
                              users[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            subtitle: Text(
                              logincontroller.loginuser.value!.about,
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
          ),
        ],
      ),
    );
  }
}
