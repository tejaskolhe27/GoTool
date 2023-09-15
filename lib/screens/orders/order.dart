import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/farm.dart';
import 'package:farmer_app/screens/orders/Outdoor/outdoord.dart';
import 'package:farmer_app/screens/orders/Workshop/workshopd.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Farm/farmd.dart';

class orders extends StatefulWidget {
  const orders({super.key});

  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Owners ',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'Paradise',
                    style: TextStyle(
                      fontSize: 19,
                      color: GlobalColors.primaryButtonColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Here's everything the product owner needs to know",
              style: TextStyle(
                fontSize: 13,
                color: GlobalColors.smallText,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: size.height * 0.175,
              width: double.infinity,
              decoration: BoxDecoration(
                color: HexColor('#e8f4f2'),
                borderRadius: BorderRadius.circular(14),
                image: const DecorationImage(
                  alignment: Alignment.bottomRight,
                  image: AssetImage('images/files.png'),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'We are unboxing your',
                      style: TextStyle(
                        color: GlobalColors.bannerText,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Farming Tools',
                      style: TextStyle(
                        color: GlobalColors.bannerText,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const Farmd()));
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                        onSurface: Colors.grey,
                        elevation: 5,
                        shadowColor: Colors.grey,
                      ),
                      child: const Text('View'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: size.height * 0.175,
              width: double.infinity,
              decoration: BoxDecoration(
                color: HexColor('#e8f4f2'),
                borderRadius: BorderRadius.circular(14),
                image: const DecorationImage(
                  alignment: Alignment.bottomRight,
                  image: AssetImage('images/files.png'),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'We are unboxing your',
                      style: TextStyle(
                        color: GlobalColors.bannerText,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Your Outdoor Tools',
                      style: TextStyle(
                        color: GlobalColors.bannerText,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Outdoord()));
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                        onSurface: Colors.grey,
                        elevation: 5,
                        shadowColor: Colors.grey,
                      ),
                      child: const Text('View'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: size.height * 0.175,
              width: double.infinity,
              decoration: BoxDecoration(
                color: HexColor('#e8f4f2'),
                borderRadius: BorderRadius.circular(14),
                image: const DecorationImage(
                  alignment: Alignment.bottomRight,
                  image: AssetImage('images/files.png'),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'We are unboxing your',
                      style: TextStyle(
                        color: GlobalColors.bannerText,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Workshop Tools',
                      style: TextStyle(
                        color: GlobalColors.bannerText,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Workshopd()));
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                        onSurface: Colors.grey,
                        elevation: 5,
                        shadowColor: Colors.grey,
                      ),
                      child: const Text('View'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
