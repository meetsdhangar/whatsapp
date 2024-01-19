import 'package:flutter/material.dart';
import 'package:whatsapp/chat.dart';

class screen1 extends StatelessWidget {
  const screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.green,
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
        title: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/profile1.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.yellow),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "meet",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "last seen today at 4:55 PM",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )
              ],
            ),
          ],
        ),
        actions: [
          Icon(
            Icons.video_call,
            color: Colors.white,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.call,
            color: Colors.white,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      bottomSheet: chat(context),
    );
  }
}
