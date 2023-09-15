import 'dart:async';

import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';



class success extends StatefulWidget {
  const success({Key? key}) : super(key: key);

  @override
  State<success> createState() => successState();
}

class successState extends State<success> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()),
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
              // padding: const EdgeInsets.symmetric(horizontal:10),
              height: size.height * 0.3,
              child: Lottie.network(
              "https://assets6.lottiefiles.com/packages/lf20_F4uAtgNqcG.json",
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.contain,
              repeat: false,
              animate: true,
              )),
              Container(
                child: const Text("Thank You!",style: TextStyle(fontFamily: "pacifico",fontSize: 50,color: Color(0xff1e9486),),),              
              ),
              SizedBox(height: 10,),
               Container(
                child: const Text("Payment Done Successfully", style: TextStyle(fontFamily: "Inter",fontSize: 20,color: Color.fromARGB(255, 0, 0, 0),),)             
              ),
              SizedBox(height: 10,),
              Container(
                child: const Text("Please wait until you are redirected to the homepage", style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 81, 81, 81),),)             
              ),
            
          ],
        ),
      ),
    );
  }
}
