// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/screens/emergency/create_emergency_profile_1.dart';
import 'package:farmer_app/screens/emergency/emergency_first_aid.dart';
import 'package:farmer_app/widgets/emergency_banner.dart';

class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  customListTile({required String text, required Function() onPressed}) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.7,
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(10.0)),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 12,
                  color: GlobalColors.smallText,
                  fontWeight: FontWeight.w600),
            ),
            Expanded(child: Container()),
            Icon(
              Icons.arrow_forward,
              size: 20.0,
              color: Color.fromRGBO(27, 29, 34, 0.35),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: GlobalColors.iconColor,
                    size: 20,
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Icon(
                        Icons.medical_services_outlined,
                      ),
                      SizedBox(width: 26),
                      Icon(
                        Icons.notifications_outlined,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 14),
              //AddressContainer(text: 'Kalyan, Maharashtra, 421301'),
              SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Case of ',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'Emergency',
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
                'For quick access during an emergency, add emergency contacts and medical services',
                style: TextStyle(
                  color: GlobalColors.smallText,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24),
              EmergencyBanner(),
              SizedBox(height: 14),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                padding: EdgeInsets.symmetric(vertical: 14),
                color: Color.fromRGBO(27, 29, 34, 0.4),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EditProfile1(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.asset('images/emergency_profile.png'),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Create Emergency Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'First Aid',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Select your emergency and follow the first aid',
                style: TextStyle(
                  fontSize: 12,
                  color: GlobalColors.smallText,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  customListTile(
                    text: 'Abdominal Pain',
                    onPressed: () {
                      showModalBottomSheet<dynamic>(
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0),
                          ),
                        ),
                        builder: (context) {
                          return EmergencyFirstAid(
                            caseName: 'Abdominal Pain',
                          );
                        },
                      );
                    },
                  ),
                  customListTile(
                    text: 'Angina (heart-related chest pain)',
                    onPressed: () {},
                  ),
                  customListTile(
                    text: 'Animal Bite',
                    onPressed: () {},
                  ),
                  customListTile(
                    text: 'Asthma',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
