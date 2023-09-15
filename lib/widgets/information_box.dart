// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:farmer_app/constants/colors.dart';

class InformationBox extends StatelessWidget {
  final String text;
  final String imageString;
  final Radius topLeft, topRight, bottomLeft, bottomRight;
  const InformationBox({
    Key? key,
    required this.text,
    required this.imageString,
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.12),
          ),
          borderRadius: BorderRadius.only(
            topLeft: topLeft,
            topRight: topRight,
            bottomLeft: bottomLeft,
            bottomRight: bottomRight,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
        child: Row(
          children: [
            Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageString),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Text(
              text,
              maxLines: 2,
              softWrap: false,
              style: const TextStyle(
                color: GlobalColors.smallText,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
