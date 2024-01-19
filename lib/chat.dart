import 'dart:js';

import 'package:flutter/material.dart';

class chat1 extends StatelessWidget {
  const chat1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            //ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                          margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type a message",
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.emoji_emotions),
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.attach_file),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.camera_alt),
                                  ),
                                ],
                              ),
                              contentPadding: EdgeInsets.all(5),
                            ),
                          ))),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, right: 5, left: 3),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFF128c7E),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.mic),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget chat(context) {
  return Container(
    color: Colors.white,
    height: 80,
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
              child: Container(
                  // width: MediaQuery.of(context).size.width - 60,
                  child: Card(
                      margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type a message",
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.emoji_emotions),
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (Builder) => bottomsheet());
                                },
                                icon: Icon(Icons.attach_file),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.camera_alt),
                              ),
                            ],
                          ),
                          contentPadding: EdgeInsets.all(5),
                        ),
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 5, left: 5),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF128c7E),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.mic),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget bottomsheet() {
  return Container(
    height: 278,
    //width: MediaQuery.of(context).size.width,
    child: Card(
      margin: EdgeInsets.all(18),
    ),
  );
}
