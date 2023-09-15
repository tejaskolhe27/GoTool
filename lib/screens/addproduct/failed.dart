import 'dart:async';

import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/screens/addproduct/additem.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class failed extends StatefulWidget {
  const failed({Key? key}) : super(key: key);

  @override
  State<failed> createState() => failedState();
}

class failedState extends State<failed> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AddItem()),
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
              "https://assets9.lottiefiles.com/packages/lf20_Dum1s3.json",
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.contain,
              repeat: false,
              animate: true,
              )),
              Container(
                child: const Text("Sorry!",style: TextStyle(fontFamily: "pacifico",fontSize: 50,color: Color.fromARGB(255, 168, 0, 0),),),              
              ),
              const SizedBox(height: 10,),
               Container(
                child: const Text("Payment failed", style: TextStyle(fontFamily: "Inter",fontSize: 20,color: Color.fromARGB(255, 0, 0, 0),),)             
              ),
              const SizedBox(height: 10,),
              Container(
                child: const Text("Wait until you are redirected to the homepage and try another payment method", style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 81, 81, 81),),)             
              ),
            
          ],
        ),
      ),
    );
  }
}
