// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final double height;
  final double borderRadius;
  final double horizontalPadding;
  final Color textColor, buttonColor;
  const SmallButton({
    Key? key,
    required this.text,
    required this.height,
    required this.borderRadius,
    required this.horizontalPadding,
    required this.textColor,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: horizontalPadding,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 11,
          ),
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          primary: buttonColor,
        ),
      ),
    );
  }
}
