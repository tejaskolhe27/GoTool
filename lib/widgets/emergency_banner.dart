// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:farmer_app/constants/colors.dart';

class EmergencyBanner extends StatelessWidget {
  const EmergencyBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.154,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 212, 212, 1),
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          alignment: Alignment.bottomRight,
          image: AssetImage('images/emergency.png'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Call an Ambulance',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap here to dial 112',
              style: TextStyle(
                color: HexColor('#1B1D22'),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 34,
              width: 110,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 100, 100, 1),
                borderRadius: BorderRadius.circular(17),
              ),
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                child: Text(
                  'Emergency Call',
                  style: TextStyle(
                    color: GlobalColors.backgroundColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
