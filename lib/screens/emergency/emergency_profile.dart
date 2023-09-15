// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:farmer_app/constants/colors.dart';
// ignore: unused_import
import 'package:farmer_app/widgets/address_container.dart';
import 'package:farmer_app/widgets/alert_banner.dart';
import 'package:farmer_app/widgets/emergency_banner.dart';

class EmergencyProfile extends StatelessWidget {
  const EmergencyProfile({Key? key}) : super(key: key);

  uploadTile(
      {required String imageString,
      required String text,
      required Function() onPressed}) {
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
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageString),
                ),
              ),
            ),
            SizedBox(width: 14),
            Text(
              text,
              style: TextStyle(
                  fontSize: 12,
                  color: GlobalColors.smallText,
                  fontWeight: FontWeight.w400),
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

  emergencyContact({
    required String imageString,
    required String name,
    required Function() onPressed,
    required String number,
  }) {
    return Container(
      height: 50,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageString),
                ),
              ),
            ),
            SizedBox(width: 14),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    number,
                    style: TextStyle(
                      fontSize: 12,
                      color: GlobalColors.smallText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/phone_call.png'),
                ),
              ),
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
          padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 36),
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
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color.fromRGBO(27, 29, 34, 0.3),
                  ),
                ),
              ),
              SizedBox(height: 14),
              uploadTile(
                text: 'Edit Emergency Profile',
                imageString: 'images/edit.png',
                onPressed: () {},
              ),
              SizedBox(height: 14),
              uploadTile(
                text: 'Delete Emergency Profile',
                imageString: 'images/delete.png',
                onPressed: () {},
              ),
              SizedBox(height: 24),
              AlertBanner(),
              SizedBox(height: 14),
              emergencyContact(
                imageString: 'images/person_male.png',
                name: 'Priyam Soni',
                number: '7021320578',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
