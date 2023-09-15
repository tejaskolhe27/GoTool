// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, deprecated_member_use

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'package:farmer_app/constants/colors.dart';
// import 'package:farmer_app/screens/home/home_Screen.dart';
import 'package:farmer_app/screens/login/trouble_signin_screen.dart';
import 'package:farmer_app/screens/main_page.dart';
import 'package:farmer_app/widgets/information_box.dart';
import 'package:farmer_app/widgets/policy_text.dart';
import 'package:farmer_app/widgets/progress_dialog.dart';

class VerifyYourNumberScreen extends StatefulWidget {
  final String verificationID;
  const VerifyYourNumberScreen({Key? key, required this.verificationID})
      : super(key: key);

  @override
  State<VerifyYourNumberScreen> createState() => _VerifyYourNumberScreenState();
}

class _VerifyYourNumberScreenState extends State<VerifyYourNumberScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(241, 241, 241, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    _pinPutController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _pinPutController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${_pinPutController.text}');
  }

  showDialogBox(String text) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => ProgressDialog(
        status: text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    verifyOTP() async {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationID,
        smsCode: _pinPutController.text,
      );

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        if (userCredential.user != null) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        }
      } on FirebaseAuthException catch (ex) {
        print(ex.code.toString());
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: GlobalColors.backgroundColor,
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 36),
        child: PolicyText(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 36),
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
                  const SizedBox(width: 8),
                  Text(
                    'Edit Number',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(20, 22, 28, 0.7),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Verify your ',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'Phone Number',
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
                'Please enter the OTP sent to +91 1234567890',
                style: TextStyle(
                  fontSize: 13,
                  color: GlobalColors.smallText,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 26),
              Pinput(
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                pinAnimationType: PinAnimationType.fade,
                length: 6,
                keyboardType: TextInputType.number,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text(
                  'Verify OTP',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                onPressed: () {
                  showDialogBox('Verifying OTP');
                  verifyOTP();
                  Timer(
                    const Duration(seconds: 4),
                    () => Navigator.pop(context),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minimumSize: Size(double.infinity, 50),
                  primary: GlobalColors.primaryButtonColor,
                ),
              ),
              SizedBox(height: 21),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Resend code in ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(27, 29, 34, 0.4),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: '00:57',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.23),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      //splashColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TroubleSigninScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Having trouble signing in?',
                        style: TextStyle(
                          color: GlobalColors.primaryButtonColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),
              InformationBox(
                imageString: 'images/shield_tick.png',
                text:
                    'All your personal information is safely encrypted \nand secured',
                topLeft: Radius.circular(9),
                topRight: Radius.circular(9),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              InformationBox(
                imageString: 'images/shield_tick.png',
                text:
                    'We use your data purely for purchase and \ntransaction updates',
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(9),
                bottomRight: Radius.circular(9),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
