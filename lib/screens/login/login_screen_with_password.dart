// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/screens/main_page.dart';
import 'package:farmer_app/widgets/custom_button.dart';
import 'package:farmer_app/widgets/custom_textfield.dart';
import 'package:farmer_app/widgets/login_banner.dart';
import 'package:farmer_app/widgets/policy_text.dart';

class LoginScreenWithPassword extends StatefulWidget {
  const LoginScreenWithPassword({Key? key}) : super(key: key);

  @override
  State<LoginScreenWithPassword> createState() =>
      _LoginScreenWithPasswordState();
}

class _LoginScreenWithPasswordState extends State<LoginScreenWithPassword> {
  final numberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    numberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 36),
        child: PolicyText(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              const LoginBanner(),
              SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome to ',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'Terna Pharmacy',
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
                'Enter your Phone Number to get started',
                style: TextStyle(
                  fontSize: 13,
                  color: GlobalColors.smallText,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 26),
              CustomTextField(
                controller: numberController,
                text: '+91',
                hintText: 'Enter your phone number',
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: passwordController,
                text: '🔒',
                hintText: 'Enter your password',
              ),
              SizedBox(height: 16),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                color: GlobalColors.primaryButtonColor,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    height: 1,
                    width: size.width * 0.4,
                    color: Color.fromRGBO(240, 240, 240, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'or',
                      style: TextStyle(
                        color: Color.fromRGBO(27, 29, 34, 0.5),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: size.width * 0.4,
                    color: Color.fromRGBO(240, 240, 240, 1),
                  ),
                ],
              ),
              SizedBox(height: 16),
              CustomButton(
                text: 'Log in using Password',
                onPressed: () {},
                color: GlobalColors.secondaryButtonColor,
              ),
              SizedBox(height: 16),
              CustomButton(
                text: 'Sign in with Truecaller',
                onPressed: () {},
                color: GlobalColors.secondaryButtonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
