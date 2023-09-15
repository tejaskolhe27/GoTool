// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/screens/login/login_screen_with_password.dart';
import 'package:farmer_app/screens/login/verify_your_number_screen.dart';
import 'package:farmer_app/widgets/custom_button.dart';
import 'package:farmer_app/widgets/custom_textfield.dart';
import 'package:farmer_app/widgets/login_banner.dart';
import 'package:farmer_app/widgets/policy_text.dart';
import 'package:farmer_app/widgets/progress_dialog.dart';
//import 'package:truecaller_sdk/truecaller_sdk.dart';

class LoginScreenWithOTP extends StatefulWidget {
  const LoginScreenWithOTP({Key? key}) : super(key: key);

  @override
  State<LoginScreenWithOTP> createState() => _LoginScreenWithOTPState();
}

class _LoginScreenWithOTPState extends State<LoginScreenWithOTP> {
  // bottomSheet(BuildContext context) {
  //   final size = MediaQuery.of(context).size;
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //           height: size.height * 0.35,
  //           width: double.infinity,
  //           decoration: const BoxDecoration(
  //             borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(12),
  //               topRight: Radius.circular(12),
  //             )
  //           ),
  //         );
  //       },);
  // }

  // late Stream<TruecallerSdkCallback>? _stream;

  // @override
  // void initState() {
  //   super.initState();
  //   _stream = TruecallerSdk.streamCallbackData;
  // }

  // signWithTrueCaller() {
  //   return StreamBuilder<TruecallerSdkCallback>(
  //       stream: _stream,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           switch (snapshot.data!.result) {
  //             case TruecallerSdkCallbackResult.success:
  //               return Text(
  //                   "Hi, ${snapshot.data!.profile!.firstName} ${snapshot.data!.profile!.lastName}"
  //                   "\nBusiness Profile: ${snapshot.data!.profile!.isBusiness}");
  //             case TruecallerSdkCallbackResult.failure:
  //               return Text("Oops!! Error type ${snapshot.data!.error!.code}");
  //             case TruecallerSdkCallbackResult.verification:
  //               return Column(
  //                 children: [
  //                   Text("Verification Required : "
  //                       "${snapshot.data!.error != null ? snapshot.data!.error!.code : ""}"),
  //                   MaterialButton(
  //                     color: Colors.green,
  //                     onPressed: () {
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (context) => MainPage(),
  //                         ),
  //                       );
  //                     },
  //                     child: Text(
  //                       "Do manual verification",
  //                       style: TextStyle(color: Colors.white),
  //                     ),
  //                   )
  //                 ],
  //               );
  //             default:
  //               return Text("Invalid result");
  //           }
  //         } else {
  //           return Text("");
  //         }
  //       });
  // }

  final numberController = TextEditingController();
  // String? _verificationCode;

  void sendOTP() async {
    String phone = "+91" + numberController.text.trim();

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      codeSent: (verificationId, resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyYourNumberScreen(
              verificationID: verificationId,
            ),
          ),
        );
      },
      verificationCompleted: (credential) {},
      verificationFailed: (ex) {
        print(ex.code.toString());
      },
      codeAutoRetrievalTimeout: (verificationId) {},
      timeout: Duration(seconds: 60),
    );

    // Popping out the dialog box
    // Navigator.pop(context);
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
  void dispose() {
    super.dispose();
    numberController.dispose();
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
              CustomButton(
                text: 'Send OTP',
                onPressed: () {
                  showDialogBox('Sending OTP');
                  sendOTP();
                  Timer(
                    const Duration(seconds: 4),
                    () => Navigator.pop(context),
                  );
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => VerifyYourNumberScreen(
                  //               verificationID: '',
                  //             )));
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreenWithPassword(),
                    ),
                  );
                },
                color: GlobalColors.secondaryButtonColor,
              ),
              SizedBox(height: 16),
              CustomButton(
                text: 'Sign in with Truecaller',
                onPressed: () {
                  // TruecallerSdk.initializeSDK(
                  //     sdkOptions: TruecallerSdkScope.SDK_OPTION_WITH_OTP);
                  // TruecallerSdk.isUsable.then((isUsable) {
                  //   if (isUsable) {
                  //     TruecallerSdk.getProfile;
                  //   } else {
                  //     final snackBar = SnackBar(content: Text("Not Usable"));
                  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //     print("***Not usable***");
                  //   }
                  // });
                  // signWithTrueCaller();
                },
                color: GlobalColors.secondaryButtonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
