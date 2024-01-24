import 'package:flutter/material.dart';

import '../Widgets/chatwidget.dart';

class Screeen2 extends StatefulWidget {
  const Screeen2({super.key});

  @override
  State<Screeen2> createState() => _Screeen2State();
}

var myIndex = 0;
var screens = [
  Chatwidget(),
];

class _Screeen2State extends State<Screeen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        useLegacyColorScheme: false,
        // useLegacyColorScheme: true,
        iconSize: 28,
        selectedFontSize: 20,
        selectedItemColor: Colors.green,
        //showSelectedLabels: false,
        //showUnselectedLabels: false,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.yellow,
        //selectedLabelStyle: TextStyle(fontSize: 1),
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: "Setting",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            label: "Messege",
          ),
        ],
        onTap: (value) {
          setState(() {
            myIndex = value;
          });
        },
      ),
      body: Center(
        child: screens[myIndex],
      ),
    );
  }
}
