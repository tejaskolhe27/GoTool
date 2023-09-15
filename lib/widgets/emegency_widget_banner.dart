// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class EmergencyWidgetBanner extends StatefulWidget {
  const EmergencyWidgetBanner({Key? key}) : super(key: key);

  @override
  State<EmergencyWidgetBanner> createState() => _EmergencyWidgetBannerState();
}

class _EmergencyWidgetBannerState extends State<EmergencyWidgetBanner> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.170,
      width: double.infinity,
      decoration: BoxDecoration(
        color: HexColor('#f7f7f7'),
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          alignment: Alignment.bottomRight,
          image: AssetImage('images/emergency_widget.png'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Emergency Widget',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Keep Terna Hospital Emergency Widget on\nYour Phone's lock screen?",
                      style: TextStyle(
                        color: HexColor('#1B1D22'),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Switch.adaptive(
                  value: value,
                  onChanged: (val) {
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              height: 34,
              width: 120,
              decoration: BoxDecoration(
                color: HexColor('#e6e9f3'),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                child: Text(
                  'Preview Widget',
                  style: TextStyle(
                    color: HexColor('#4365CD'),
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
