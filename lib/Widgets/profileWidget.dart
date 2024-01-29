import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
