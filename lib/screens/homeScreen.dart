import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Utils/colors.dart';
import 'package:whatsapp/Widgets/groupWidget.dart';
import 'package:whatsapp/controllers/loginController.dart';
import 'package:whatsapp/Widgets/callswidget.dart';
import 'package:whatsapp/Widgets/chatwidget.dart';

import 'package:whatsapp/screens/profileScreen.dart';
import 'package:whatsapp/screens/selectcontact.dart';
import 'package:whatsapp/Widgets/statuswidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final logincontroller = Get.find<Logincontroller>();

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      logincontroller.changetabIndex(tabController.index);
      log('changed index: ${tabController.index.toString()}');
    });

    logincontroller.updateActiveStatus(true);

    SystemChannels.lifecycle.setMessageHandler((message) {
      log(message.toString());
      if (message.toString().contains('paused') ||
          message.toString().contains('inactive')) {
        setState(() {
          logincontroller.updateActiveStatus(false);
        });
      } else {
        setState(() {
          logincontroller.updateActiveStatus(true);
        });
      }
      return Future.value(message);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 55,
          backgroundColor: Color(0xff075E54),
          title: Text(
            "WhatsApp",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
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
                          logincontroller.userlogout();
                        },
                        child: Text("Logout"),
                        value: "Logout",
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
              controller: tabController,
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
                      "Group",
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
        floatingActionButton: logincontroller.tabIndex.value == 0
            ? FloatingActionButton(
                backgroundColor: tealDarkGreenColor,
                onPressed: () {
                  Get.to(() => Selectcontact());
                },
                child: Icon(Icons.message, color: Colors.white),
              )
            : logincontroller.tabIndex.value == 1
                ? FloatingActionButton(
                    backgroundColor: tealDarkGreenColor,
                    onPressed: () {
                      Get.to(() => Selectcontact());
                    },
                    child: Icon(Icons.message, color: Colors.white),
                  )
                : logincontroller.tabIndex.value == 2
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            backgroundColor: tealDarkGreenColor,
                            mini: true,
                            onPressed: () {},
                            child: Icon(Icons.edit, color: Colors.white),
                          ),
                          SizedBox(height: 16),
                          FloatingActionButton(
                            backgroundColor: tealDarkGreenColor,
                            onPressed: () {},
                            child: Icon(Icons.camera_alt, color: Colors.white),
                          ),
                        ],
                      )
                    : FloatingActionButton(
                        backgroundColor: tealDarkGreenColor,
                        onPressed: () {},
                        child: Icon(Icons.phone, color: Colors.white),
                      ),
        body: TabBarView(
          controller: tabController,
          children: [
            Chatwidget(),
            GroupWidget(),
            StatusWidget(context),
            Callswidget(),
          ],
        ),
      ),
    );
  }
}
