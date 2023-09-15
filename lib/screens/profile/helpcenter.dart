import 'package:farmer_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:farmer_app/widgets/call_banner.dart';
import 'package:farmer_app/widgets/email_banner.dart';
import 'package:farmer_app/widgets/sms_banner.dart';

class helpcenter extends StatefulWidget {
  const helpcenter({Key? key}) : super(key: key);

  @override
  State<helpcenter> createState() => _helpcenterState();
}

class _helpcenterState extends State<helpcenter> {
  @override
Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        
        child: Padding(
          
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 36),
          child: Form(

            child: Column(children: [
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: GlobalColors.iconColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: "Help Center ",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 20,
                                color: Color(0xff1e9486),
                                fontWeight: FontWeight.w700)),
                        // TextSpan(
                        //     text: "Address",
                        //     style: TextStyle(
                        //         fontFamily: 'Inter',
                        //         fontSize: 20,
                        //         color: Color(0xff1e9486),
                        //         fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Feel free to contactus whenever it is convenient for you",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      color: GlobalColors.smallText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              ///+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  Center(
        child: Column(children: const [
          Padding(padding: EdgeInsets.all(16.0)),
          EmailBanner(),
          Padding(
            padding: EdgeInsets.all(16.0),
          ),
          CallBanner(),
          Padding(padding: EdgeInsets.all(16.0)),
          SmsBanner(),
        ]),
      ),
            ]),
          ),
        ),
      ),
    );
  }
}

