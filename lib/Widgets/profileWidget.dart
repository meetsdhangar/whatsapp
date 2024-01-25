import 'package:flutter/material.dart';

Widget ProfileWidget(context, controller, title, subtitle, leadingIcon) {
  return ListTile(
    visualDensity: VisualDensity.compact,
    leading: Icon(leadingIcon,
        size: MediaQuery.of(context).size.width * 0.06,
        color: Colors.grey.shade600),
    title: Text(title),
    titleTextStyle: TextStyle(color: Colors.grey.shade600, fontSize: 15),
    subtitle: Padding(
      padding: const EdgeInsets.only(left: 5),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        cursorHeight: 25,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    ),
    trailing: Icon(
      Icons.edit,
      size: MediaQuery.of(context).size.width * 0.06,
      color: Color(0xff128C7E),
    ),
  );
}
