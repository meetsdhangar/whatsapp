import 'package:flutter/material.dart';

class status extends StatelessWidget {
  const status({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        // color: Colors.amber,
                        child: Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/profile1.jpg"),
                                    fit: BoxFit.scaleDown),
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.green),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 42,
                        top: 42,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Icon(
                            Icons.add,
                            size: 17,
                          )),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My status",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Tap to add status update",
                    style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 135, 125, 125)),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            "Recent updates",
            style: TextStyle(fontSize: 17),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/profile1.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.yellow),
                    ),
                    title: Text("Ripal"),
                    subtitle: Text("25 minutes ago"),
                  ));
            },
          ),
        ),
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
                child: Text("Settings"),
                value: "Settings",
              ),
            ];
          }),
        ),
      ],
    ));
  }
}
