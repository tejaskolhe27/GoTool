// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/screens/emergency/add_emergency_contact.dart';
import 'package:farmer_app/widgets/custom_button.dart';

class CreateEmergencyProfileExtended extends StatefulWidget {
  const CreateEmergencyProfileExtended({Key? key}) : super(key: key);

  @override
  State<CreateEmergencyProfileExtended> createState() =>
      _CreateEmergencyProfileExtendedState();
}

class _CreateEmergencyProfileExtendedState
    extends State<CreateEmergencyProfileExtended> {
  final existingAlignmentController = TextEditingController();
  final currentMedicationController = TextEditingController();
  final yourAllergiesController = TextEditingController();
  final previousSurgeriesController = TextEditingController();

  customField(String text, TextEditingController controller, String hintText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: Color.fromRGBO(27, 29, 34, 0.6),
            fontWeight: FontWeight.w500,
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

  List<String> items = [
    'Select',
    "Yes",
    "No",
  ];

  String selectedItem = 'Select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 16),
        child: CustomButton(
          text: 'Save Profile',
          onPressed: () {},
          color: GlobalColors.primaryButtonColor,
        ),
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
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: GlobalColors.iconColor,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Edit Personal Details",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color.fromRGBO(20, 22, 28, 0.7),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Create ",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: "Emergency Profile",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          color: HexColor("#FF953A"),
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "For quick access during an emergency, add emergency contacts and medical services",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: GlobalColors.smallText,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24),
              Text(
                "Add your Emergency Contacts",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(27, 29, 34, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Quick dial one of emergency numbers in case of emergency",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12,
                  color: GlobalColors.smallText,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                padding: EdgeInsets.symmetric(vertical: 14),
                color: Color.fromRGBO(27, 29, 34, 0.4),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet<dynamic>(
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0),
                                ),
                              ),
                              builder: (context) {
                                return AddEmergencyContact();
                              });
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.asset('images/emergency_profile.png'),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Add Emergency Contact',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Add your Health Details",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(27, 29, 34, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 18),
              customField(
                'Your Existing Ailments (if any)',
                existingAlignmentController,
                'e.g. Rash',
              ),
              SizedBox(height: 18),
              customField(
                'Your Current Medication (if any)',
                currentMedicationController,
                'e.g. Paracetamol',
              ),
              SizedBox(height: 18),
              customField(
                'Your Allergies (if any)',
                yourAllergiesController,
                'e.g. Dust Mites',
              ),
              SizedBox(height: 18),
              customField(
                'Previous Surgeries (if any)',
                previousSurgeriesController,
                'e.g. Rash',
              ),
              SizedBox(height: 18),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Do you have any health insurance?',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(27, 29, 34, 0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(241, 241, 241, 1),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedItem,
                      underline: Container(
                        color: Colors.transparent,
                      ),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(27, 29, 34, 1),
                      ),
                      items: items
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ),
                          )
                          .toList(),
                      onChanged: (item) {
                        setState(() {
                          selectedItem = item!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
