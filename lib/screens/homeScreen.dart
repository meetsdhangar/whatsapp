import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/controllers/loginController.dart';
import 'package:whatsapp/Widgets/callswidget.dart';
import 'package:whatsapp/Widgets/chatwidget.dart';
import 'package:whatsapp/screens/profileScreen.dart';
import 'package:whatsapp/screens/selectcontact.dart';
import 'package:whatsapp/Widgets/statuswidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.find<Logincontroller>();
    var size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          backgroundColor: Color.fromARGB(255, 4, 86, 4),
          leadingWidth: 30,
          title: Text(
            "WhatsApp",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            InkWell(
              onTap: () {
                logincontroller.userlogout();
              },
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              child: PopupMenuButton<String>(
                  onSelected: (value) {},
                  itemBuilder: (BuildContext contesxt) {
                    return [
                      PopupMenuItem(
                        child: Text("New group"),
                        value: "New group",
                      ),
                      PopupMenuItem(
                        child: Text("New broadcast"),
                        value: "New broadcast",
                      ),
                      PopupMenuItem(
                        child: Text("Linked device"),
                        value: "Linked device",
                      ),
                      PopupMenuItem(
                        child: Text("Starred message"),
                        value: "Starred message",
                      ),
                      PopupMenuItem(
                        child: Text("Payments"),
                        value: "Payments",
                      ),
                      PopupMenuItem(
                        onTap: () {
                          Get.to(() => Profile());
                        },
                        child: Text("Settings"),
                        value: "Settings",
                      ),
                    ];
                  }),
            ),
            SizedBox(width: 10),
          ],
          bottom: TabBar(
              labelColor: Colors.amber,
              labelStyle: TextStyle(fontSize: 20),
              unselectedLabelStyle: TextStyle(fontSize: 15),
              unselectedLabelColor: Colors.red,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.only(bottom: 2),
              tabs: [
                Container(
                    width: size.width,
                    height: 40,
                    child: Center(
                        child: Text(
                      "Chat",
                      style: TextStyle(color: Colors.white),
                    ))),
                Container(
                    width: size.width,
                    height: 40,
                    child: Center(
                        child: Text(
                      "Status",
                      style: TextStyle(color: Colors.white),
                    ))),
                Container(
                    width: size.width,
                    height: 40,
                    child: Center(
                        child: Text(
                      "Calls",
                      style: TextStyle(color: Colors.white),
                    ))),
              ]),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return selectcontact();
                  },
                ),
              ),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [Chatwidget(), StatusWidget(), Callswidget()],
        ),
      ),
    );
  }
}
