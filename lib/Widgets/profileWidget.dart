import 'package:flutter/material.dart';

Widget ProfileWidget(context, controller, title, subtitle, leadingIcon) {
  return ListTile(
    visualDensity: VisualDensity.compact,
    leading: Icon(leadingIcon,
        size: MediaQuery.of(context).size.width * 0.06,
        color: Colors.grey.shade600),
    title: Text(title),
    titleTextStyle: TextStyle(color: Colors.grey.shade600, fontSize: 13),
    subtitle: Padding(
      padding: const EdgeInsets.only(top: 13, left: 5),
      child: Container(
        height: 24,
        child: Center(
          child: TextFormField(
            controller: controller,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            cursorHeight: 15,
            decoration: InputDecoration(
              hintText: subtitle,
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                  color: Colors.black),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
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
