// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/widgets/custom_button.dart';

class AddEmergencyContact extends StatefulWidget {
  const AddEmergencyContact({Key? key}) : super(key: key);

  @override
  State<AddEmergencyContact> createState() => _AddEmergencyContactState();
}

class _AddEmergencyContactState extends State<AddEmergencyContact> {
  final fullNameController = TextEditingController();
  final numberController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  customField(String text, TextEditingController controller, String hintText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: text,
                style: TextStyle(
                  fontSize: 12,
                  color: GlobalColors.smallText,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: ' *',
                style: TextStyle(
                  fontSize: 14,
                  color: GlobalColors.primaryButtonColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(241, 241, 241, 1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14),
              hintText: hintText,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22),
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
                  ],
                ),
                SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Add ',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'Emergency Contact',
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
                  'Provide name and contact number of your emergency contact',
                  style: TextStyle(
                    fontSize: 13,
                    color: GlobalColors.smallText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 24),
                customField(
                  'Full Name',
                  fullNameController,
                  'e.g. Priyam Soni',
                ),
                SizedBox(height: 18),
                customField(
                  'Phone Number',
                  numberController,
                  'e.g. 7021320578',
                ),
                SizedBox(height: 18),
                CustomButton(
                  text: 'Check Availability',
                  onPressed: () {},
                  color: GlobalColors.primaryButtonColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
