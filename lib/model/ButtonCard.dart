import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({required Key key, required this.name, required this.icon})
      : super(key: key);
  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(radius: 23, child: Icon(icon)),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
