import 'package:flutter/material.dart';
import 'package:whatsapp/screens/screen1.dart';

Widget mychat() {
  return Column(
    children: [
      Expanded(
        child: ListView.builder(
          //scrollDirection: Axis.horizontal,
          itemCount: 9,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(10.0),
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
                  title: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => screen1(),
                      ));
                    },
                    child: Text(
                      "meet",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.done_all),
                      SizedBox(
                        width: 4,
                      ),
                      Text("Hyy"),
                    ],
                  ),
                  trailing: Text("4:10pm"),
                ));
          },
        ),
      ),
    ],
  );
}
