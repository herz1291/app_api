import 'package:flutter/material.dart';

class PageLable extends StatelessWidget {
  const PageLable({super.key, this.title = ''});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Color.fromARGB(255, 0, 97, 87)),
    );
  }
}