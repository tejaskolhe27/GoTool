import 'dart:async';

import 'package:farmer_app/constants/colors.dart';
import 'package:flutter/material.dart';

import '../login.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const login()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: size.height * 0.3,
              child: Image.asset(
                'assets/images/Go.gif',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 150),
              child: CircularProgressIndicator(
                color: GlobalColors.backgroundColor,
                backgroundColor: GlobalColors.primaryButtonColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
