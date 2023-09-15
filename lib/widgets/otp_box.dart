// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OTPBox extends StatelessWidget {
  const OTPBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 5.2,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromRGBO(241, 241, 241, 1),
        ),
      ),
      child: Center(
        child: Text(
          '0',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(27, 29, 34, 0.3),
          ),
        ),
      ),
    );
  }
}
