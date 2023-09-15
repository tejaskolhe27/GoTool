// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:farmer_app/screens/prescription/prescription.dart';

class SmsBanner extends StatelessWidget {
  const SmsBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.164,
      width: double.infinity,
      decoration: BoxDecoration(
        color: HexColor('#e8f4f2'),
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
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
              'Message your Querry ',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '+91-7066586280',
              style: TextStyle(
                color: HexColor('#1B1D22'),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 18),
            GestureDetector(
    
              child: Container(
                height: 45,
                width: 100,

                decoration: BoxDecoration(
                  color: HexColor('#d2e9e6'),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Center(
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                        
                      child: TextButton(
                        
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          const url = 'sms:7066586280';
                          final uri = Uri.parse(url);
                          launchUrl(uri);
                        },
                        child: Text(
                          'Send',
                        
                          style: TextStyle(
                            color: HexColor('#1e9486'),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
