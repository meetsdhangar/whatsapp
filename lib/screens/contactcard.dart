import 'package:flutter/material.dart';
import 'package:whatsapp/model/Chatmodel.dart';

class Contactcard extends StatelessWidget {
  const Contactcard({super.key, required this.contact});
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          child: Image.asset(
            ("assets/images/user.png"),
            color: Colors.white,
            height: 30,
            width: 30,
          ),
          backgroundColor: Colors.green,
        ),
        title: Text(
          contact.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          contact.status,
          style: TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
