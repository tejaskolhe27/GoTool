// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/screens/emergency/create_emergency_profile_2.dart';
import 'package:farmer_app/widgets/custom_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

class EditProfile1 extends StatefulWidget {
  const EditProfile1({Key? key}) : super(key: key);

  @override
  State<EditProfile1> createState() => _EditProfile1State();
}

class _EditProfile1State extends State<EditProfile1> {
  final fullNameController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  late DateTime _dateTime;
  String time = "Select date";

  List items = [
    'Select blood group',
    'A+',
    'B+',
    'O+',
    'AB+',
    'A-',
    'O-',
    'B-',
    'AB-',
  ];

  String selectedItem = "Select blood group";

  heightWeight(
      {required String text,
      required TextEditingController controller,
      required String hintText}) {
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
          width: MediaQuery.of(context).size.width * 0.4,
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
              color: Color.fromRGBO(27, 29, 34, 0.9),
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 14),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 13,
                color: Color.fromRGBO(27, 29, 34, 0.3),
                fontWeight: FontWeight.w400,
              ),
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
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 16),
        child: CustomButton(
          text: 'Next (Step 1 of 2)',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CreateEmergencyProfileExtended(),
              ),
            );
          },
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
                      text: "Personal Detail",
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
                "----------------------------------------------------------------------------",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: GlobalColors.smallText,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24),
              SizedBox(height: 26),
              Text(
                "Personal Details",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: GlobalColors.smallText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Enter your personal details",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: GlobalColors.smallText,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 18),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: "Your Name ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(27, 29, 34, 0.6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "*",
                        style: TextStyle(
                          fontSize: 14,
                          color: GlobalColors.primaryButtonColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ]),
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
                      controller: fullNameController,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(27, 29, 34, 0.9),
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 14),
                        hintText: 'e.g. Tejas Kolhe',
                        hintStyle: TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(27, 29, 34, 0.3),
                          fontWeight: FontWeight.w400,
                        ),
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
              ),
              SizedBox(height: 18),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: "Date of Birth",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(27, 29, 34, 0.6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "*",
                        style: TextStyle(
                          fontSize: 14,
                          color: GlobalColors.primaryButtonColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(235, 241, 241, 1),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(27, 29, 34, 0.3),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          height: 24,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            //color: HexColor("#FF6464"),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              primary: HexColor('#fff7f0'),
                            ),
                            onPressed: () async {
                              _dateTime = (await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1960),
                                  lastDate: DateTime(2030)))!;

                              setState(() {
                                // time = DateFormat('dd-MM-yy').format(_dateTime);
                              });
                            },
                            child: Text(
                              "Select",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                color: HexColor("#FF953A"),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: "Gender",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(27, 29, 34, 0.6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "*",
                        style: TextStyle(
                          fontSize: 14,
                          color: GlobalColors.primaryButtonColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(height: 8),
                  ToggleSwitch(
                    labels: ['Male', 'Female', 'Other'],
                    minWidth: MediaQuery.of(context).size.width / 3.418,
                    minHeight: 48,
                    cornerRadius: 10,
                    borderWidth: 1,
                    borderColor: [
                      Color.fromRGBO(235, 241, 241, 1),
                    ],
                    activeBgColor: [
                      Color.fromARGB(255, 247, 232, 232),
                      Color.fromARGB(255, 247, 232, 232),
                      Color.fromARGB(255, 247, 232, 232)
                    ],
                    fontSize: 13,
                    dividerColor: Color.fromRGBO(235, 235, 241, 1),
                    activeFgColor: HexColor("#FF953A"),
                    inactiveFgColor: Color.fromRGBO(27, 29, 34, 0.5),
                    inactiveBgColor: Colors.white,
                    onToggle: (index) {
                      print('switched to: $index');
                    },
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
