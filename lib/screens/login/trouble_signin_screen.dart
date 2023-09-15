// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/widgets/custom_button.dart';

class TroubleSigninScreen extends StatefulWidget {
  const TroubleSigninScreen({Key? key}) : super(key: key);

  @override
  State<TroubleSigninScreen> createState() => _TroubleSigninScreenState();
}

class _TroubleSigninScreenState extends State<TroubleSigninScreen> {
  final fullNameController = TextEditingController();
  final numberController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    numberController.dispose();
    messageController.dispose();
    super.dispose();
  }

  customField(String text, TextEditingController controller, String hintText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: text,
                style: TextStyle(
                  fontSize: 12,
                  color: GlobalColors.smallText,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: ' *',
                style: TextStyle(
                  fontSize: 14,
                  color: GlobalColors.primaryButtonColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(241, 241, 241, 1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14),
              hintText: hintText,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
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
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: GlobalColors.iconColor,
                      size: 20,
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Having Trouble ',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'Signing In',
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
                'Let us know the trouble you are facing and our team \nwill reach out to you to get this resolved',
                style: TextStyle(
                  fontSize: 13,
                  color: GlobalColors.smallText,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 30),
              customField(
                'Full Name',
                fullNameController,
                'e.g. Priyam Soni',
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Mobile Number',
                      style: TextStyle(
                        fontSize: 12,
                        color: GlobalColors.smallText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        fontSize: 14,
                        color: GlobalColors.primaryButtonColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(241, 241, 241, 1),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        '+91',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: numberController,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter your phone number',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              customField(
                'Message',
                messageController,
                'Describe your issue',
              ),
              SizedBox(height: 26),
              CustomButton(
                text: 'Submit issue',
                onPressed: () {},
                color: GlobalColors.primaryButtonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
