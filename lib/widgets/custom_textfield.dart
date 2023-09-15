// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String text;
  final TextEditingController controller;
  const CustomTextField({Key? key, required this.hintText, required this.text, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(241, 241, 241, 1),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
