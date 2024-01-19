import 'package:flutter/material.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

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
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/link.png"),
                          fit: BoxFit.scaleDown),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create call link",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Share a link for your WhatsApp call",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 130, 123, 123)),
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
            "Recent",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: 200,
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
                    title: Text("meet"),
                    subtitle: Text("20 September, 8:00pm"),
                    trailing: Icon(Icons.call),
                  ));
            },
          ),
        ),
        // Expanded(child: Image.asset("assets/images/profile1.jpg")),
      ],
    ));
  }
}
