// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/widgets/custom_button.dart';

class EmergencyFirstAid extends StatelessWidget {
  final String caseName;
  const EmergencyFirstAid({Key? key, required this.caseName}) : super(key: key);

  firstAidText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: Color.fromRGBO(27, 29, 34, 1),
        fontWeight: FontWeight.w400,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        color: GlobalColors.iconColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Aid your ',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: caseName,
                        style: TextStyle(
                          fontSize: 19,
                          color: GlobalColors.primaryButtonColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Here are some important tips to follow in case of ${caseName.toLowerCase()}',
                  style: TextStyle(
                    fontSize: 13,
                    color: GlobalColors.smallText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 24),
                firstAidText(
                  '''1. Sit or lie down in most comfortable position for you.

2. Do not eat or drink any food item or painkillers like ibuprofen, aspirin.

3. Take an antacid, if a known diagnosis of stomach ulcer, hyperacidity, etc. exists in the case of upper abdominal pain/burning.

4. If there is associated breathlessness, chest pain, vomiting, high fever, or if the pain is continuous or severe or lasts beyond 30 minutes, rush to the hospital.''',
                ),
                SizedBox(height: 24),
                CustomButton(
                  text: 'Call for an Emergency',
                  onPressed: () {},
                  color: HexColor('#FF6464'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
