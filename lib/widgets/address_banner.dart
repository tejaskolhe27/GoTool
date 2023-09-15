import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AddressBanner extends StatelessWidget {
  String Address = ' ';
  String Building = ' ';
  String Street = ' ';
  String Sublocality = ' ';
  String Locality = ' ';
  String State = ' ';
  String Pincode = ' ';
  String Country = ' ';

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 230,
        // height: 160,
        //color: Colors.white,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: Colors.grey.shade400,
          ),
        ),
        margin: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Building :  ',
                    style: TextStyle(
                      fontSize: 14,
                      color: GlobalColors.smallText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: '${Building}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Street :  ',
                    style: TextStyle(
                      fontSize: 14,
                      color: GlobalColors.smallText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: '${Street}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            const SizedBox(height: 3),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Locality :  ',
                    style: TextStyle(
                      fontSize: 14,
                      color: GlobalColors.smallText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: '${Locality}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'State :  ',
                    style: TextStyle(
                      fontSize: 14,
                      color: GlobalColors.smallText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: '${State}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Pincode :  ',
                    style: TextStyle(
                      fontSize: 14,
                      color: GlobalColors.smallText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: '${Pincode}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Country :  ',
                    style: TextStyle(
                      fontSize: 14,
                      color: GlobalColors.smallText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    // ignore: unnecessary_string_interpolations
                    text: '${Country}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ));
  }
}
