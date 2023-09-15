// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Color.fromRGBO(27, 29, 34, 0.4),
        height: 1.2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      buildDivider(),
      Text(
        "    or    ",
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
      ),
      buildDivider(),
    ]);
  }
}
