// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class PolicyText extends StatelessWidget {
  const PolicyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By proceeding you agree to our ',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(27, 29, 34, 0.4),
            ),
          ),
          TextSpan(
            text: 'Privacy policy ',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(27, 29, 34, 0.4),
            ),
          ),
          TextSpan(
            text: 'and ',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(27, 29, 34, 0.4),
            ),
          ),
          TextSpan(
            text: 'Terms and Conditions',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(27, 29, 34, 0.4),
            ),
          ),
        ],
      ),
    );
  }
}
