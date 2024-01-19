import 'package:flutter/material.dart';

import 'package:whatsapp/screens/calls.dart';
import 'package:whatsapp/screens/loginscreen.dart';
import 'package:whatsapp/screens/screen2.dart';

import 'package:whatsapp/screens/status.dart';

import 'screens/mychat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}

void changemethod() {}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color.fromARGB(255, 4, 86, 4),
          leadingWidth: 30,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
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

            // Icon(
            //   Icons.more_vert,
            //   color: Colors.white,
            // ),
            Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              child: PopupMenuButton<String>(onSelected: (value) {
                print("Value");
              }, itemBuilder: (BuildContext contesxt) {
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
              // isScrollable: true,
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
        // persistentFooterButtons: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.call),
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.call),
        //   )
        // ],
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Screeen2();
                  },
                ),
              ),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.green,
                child: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),

        //  FloatingActionButton(
        //   onPressed: () {},
        //   backgroundColor: Colors.green,
        //   child: Icon(Icons.message),
        // ),
        body: TabBarView(
          children: [mychat(), status(), Calls()],
        ),
      ),
    );
  }
}
