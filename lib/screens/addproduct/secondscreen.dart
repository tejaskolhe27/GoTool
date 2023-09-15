import 'package:flutter/material.dart';

class Second extends StatelessWidget {
final String text;

  // receive data from the FirstScreen as a parameter
  Second({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text)

      ),
    );
  }
}