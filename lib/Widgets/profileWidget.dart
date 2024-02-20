import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utils/colors.dart';

// Widget ProfileWidget(context, controller, title, subtitle, leadingIcon) {
//   return ListTile(
//     visualDensity: VisualDensity.compact,
//     leading: Icon(leadingIcon,
//         size: MediaQuery.of(context).size.width * 0.06,
//         color: Colors.grey.shade600),
//     title: Text(title),
//     titleTextStyle: TextStyle(color: Colors.grey.shade600, fontSize: 15),
//     subtitle: Padding(
//       padding: const EdgeInsets.only(left: 5),
//       child: TextFormField(
//         controller: controller,
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 17,
//           fontWeight: FontWeight.bold,
//         ),
//         cursorHeight: 25,
//         decoration: InputDecoration(
//           enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
//           focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
//         ),
//       ),
//     ),
//     trailing: Icon(
//       Icons.edit,
//       size: MediaQuery.of(context).size.width * 0.06,
//       color: Color(0xff128C7E),
//     ),
//   );
Widget ProfileWidget(context, controller, title, subtitle, leadingIcon) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 15,
      top: 0,
      bottom: 0,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Text(
            title,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
          ),
        ),
        Row(
          children: [
            Icon(leadingIcon,
                size: MediaQuery.of(context).size.width * 0.06,
                color: Colors.grey.shade600),
            15.widthBox,
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                controller: controller,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                cursorHeight: 25,
                decoration: InputDecoration(
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            Expanded(
              child: Icon(
                Icons.edit,
                size: MediaQuery.of(context).size.width * 0.06,
                color: Color(0xff128C7E),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget ProfileContainer(
  icon,
  text,
  context,
) {
  return Container(
    height: MediaQuery.of(context).size.width / 5.5,
    width: MediaQuery.of(context).size.width / 5,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 0.5, color: Colors.grey.shade300)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: tealGreenColor),
        Text(text, style: TextStyle(fontSize: 13))
      ],
    ),
  );
}

Widget listtile(text, icon) {
  return ListTile(
    contentPadding: EdgeInsets.only(left: 15, right: 10),
    visualDensity: VisualDensity.compact,
    leading: Icon(icon, color: Colors.grey.shade600),
    title: Text(text),
    titleTextStyle: TextStyle(fontSize: 15, color: Colors.black),
  );
}
