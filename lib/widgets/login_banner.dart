// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:farmer_app/constants/colors.dart';

class LoginBanner extends StatelessWidget {
  const LoginBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.175,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(204, 242, 255, 0.45),
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          alignment: Alignment.topRight,
          image: AssetImage('images/giftbox.png'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'We are unboxing your',
              style: TextStyle(
                color: GlobalColors.bannerText,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'offer...',
              style: TextStyle(
                color: GlobalColors.bannerText,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 34,
              width: 88,
              decoration: BoxDecoration(
                color: GlobalColors.primaryButtonColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                child: Text(
                  'NEW50',
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
