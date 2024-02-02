import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/controllers/homeController.dart';

import 'package:whatsapp/controllers/loginController.dart';
import 'package:whatsapp/model/chatuserModel.dart';
import 'package:whatsapp/screens/chatscreen.dart';
import 'package:whatsapp/screens/newgroup.dart';

class Selectcontact extends StatelessWidget {
  const Selectcontact({super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.find<Logincontroller>();
    final homecontroller = Get.find<HomeController>();
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
              "Select contact",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "302 contacts",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.to(() => NewGroup(
                      memberlist: homecontroller.totalmembers.value,
                    ));
              },
              child: ListTile(
                //contentPadding: EdgeInsets.all(0),
                contentPadding:
                    EdgeInsets.only(top: 10, left: 10, right: 0, bottom: 0),
                leading: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 15, 139, 125),
                  radius: 24,
                  child: Icon(
                    Icons.group,
                    color: Colors.white,
                  ),
                ),
                title: Text("New Group"),
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
            ),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Text(
                "Contacts on WhatsApp",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
              ),
            ),
            10.heightBox,
            StreamBuilder(
                stream: logincontroller.firestore
                    .collection('users')
                    .where('id',
                        isNotEqualTo: logincontroller.loginuser.value?.id)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ChatUser> users = [];
                    final data = snapshot.data?.docs;
                    users =
                        data?.map((e) => ChatUser.fromMap(e.data())).toList() ??
                            [];
                    homecontroller.totalmembers.value = [];
                    homecontroller.totalmembers.addAll(users);
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
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
                            subtitle: Text(
                              users[index].about,
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
      ),
    );
  }
}
// Theme(
//             data: Theme.of(context).copyWith(
//               iconTheme: IconThemeData(
//                 color: Colors.white,
//               ),
//             ),
//             child: PopupMenuButton<String>(onSelected: (value) {
//               print("Value");
//             }, itemBuilder: (BuildContext contesxt) {
//               return [
//                 PopupMenuItem(
//                   child: Text("Invite a friend"),
//                   value: "Invite a friend",
//                 ),
//                 PopupMenuItem(
//                   child: Text("Contacts"),
//                   value: "Contacts",
//                 ),
//                 PopupMenuItem(
//                   child: Text("Refresh"),
//                   value: "Refresh",
//                 ),
//                 PopupMenuItem(
//                   child: Text(" Help"),
//                   value: "Help ",
//                 ),
//               ];
//             }),
//           ),