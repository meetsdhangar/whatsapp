import 'package:flutter/material.dart';
import 'package:whatsapp/model/ButtonCard.dart';
import 'package:whatsapp/model/Chatmodel.dart';

class selectcontact extends StatelessWidget {
  const selectcontact({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
        name: "Meet ",
        status: "A Flutter Dev..",
        icon: 'home',
        isGroup: false,
        time: "9;10pm",
        currentMessage: 'online',
      ),
      ChatModel(
        name: "Ripal ",
        status: "A Flutter Dev..",
        icon: 'home',
        isGroup: false,
        time: "9;10pm",
        currentMessage: 'online',
      ),
      ChatModel(
        name: "Dhruv ",
        status: "A Flutter Dev..",
        icon: 'home',
        isGroup: false,
        time: "9;10pm",
        currentMessage: 'online',
      ),
      ChatModel(
        name: "jay  ",
        status: "A Flutter Dev..",
        icon: 'home',
        isGroup: false,
        time: "9;10pm",
        currentMessage: 'online',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Colors.green,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "300 contacts",
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 26,
              )),
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
                  child: Text("Invite a friend"),
                  value: "Invite a friend",
                ),
                PopupMenuItem(
                  child: Text("Contacts"),
                  value: "Contacts",
                ),
                PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
                PopupMenuItem(
                  child: Text(" Help"),
                  value: "Help ",
                ),
              ];
            }),
          ),
        ],
      ),
      //       body: ListView.builder(
      //         itemCount: contacts.length,
      //         itemBuilder: (context, index) {
      //             if (index == 0){
      //               return ButtonCard(key: Key(""), name: '',);
      //             }else if (index == 1){
      //                 return ButtonCard();
      //           }
      //           return Contactcard(contact: null,);

      //           contact: contacts[index];,
      //         );
      //  }) );
    );
  }
}
