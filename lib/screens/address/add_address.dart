// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:farmer_app/screens/address/address_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/widgets/custom_button.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';

class AddAddressPage extends StatefulWidget {
  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final pinCodeController = TextEditingController();
  final AddressController = TextEditingController();
  final streetController = TextEditingController();
  final localityController = TextEditingController();

  List<String> items = [
    'Arunachal Pradesh',
    "West Bengal",
    "Mizoram",
    "Andhra Pradesh",
    "Punjab",
    "Goa",
    "Madhya Pradesh",
    "Assam",
    "Bihar",
    'Karnataka',
    'Tripura',
    'Chhattisgarh',
    'Maharashtra',
    'Haryana',
    'Gujarat',
    'Nagaland',
    'Manipur'
  ];

  String selectedItem = 'Arunachal Pradesh';

  GlobalKey<FormState> key = GlobalKey();

  CollectionReference _reference =
      FirebaseFirestore.instance.collection('Address');

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    pinCodeController.dispose();
    AddressController.dispose();
    streetController.dispose();
    localityController.dispose();
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
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                ],
              ),
              SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "Add your ",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700)),
                    TextSpan(
                        text: "Address",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            color: HexColor("#FF953A"),
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Enter your address details for delivery and contact purpose",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  color: GlobalColors.smallText,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              customField(
                'Deliver To',
                nameController,
                'Tejas Kolhe',
              ),
              SizedBox(height: 14),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Mobile Number',
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
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        '+91',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: phoneController,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter your phone number',
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
              ),
              SizedBox(height: 14),
              customField(
                'Address(House No,Building)',
                AddressController,
                'Trimurti View',
              ),
              SizedBox(height: 14),
              customField(
                'Street Name',
                streetController,
                'Tejas',
              ),

              SizedBox(height: 14),
              customField(
                'Locality',
                localityController,
                'e.g. Dist. Thane',
              ),
              SizedBox(height: 14),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'State',
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
              SizedBox(height: 14),
              customField(
                'Pin Code',
                pinCodeController,
                'e.g. 425308',
              ),

              //===================

              //=======================
              SizedBox(height: 14),
              CustomButton(
                text: 'Save Address',
                onPressed: () async {
                  if (key.currentState!.validate()) {
                    String userName = nameController.text;
                    String userPhone = phoneController.text;
                    String userAddress = AddressController.text;
                    String userStreet = streetController.text;
                    String userLocality = localityController.text;
                    String userPincode = pinCodeController.text;

                    //Create a Map of data
                    Map<String, String> dataToSend = {
                      'name': userName,
                      'phone': userPhone,
                      'address': userName,
                      'street': userPhone,
                      'locality': userName,
                      'pincode': userPincode,
                    };

                    //Add a new item
                    _reference.add(dataToSend);
                  }
                  showDialog(
                                context: context,
                                builder: (ctx) => Dialog(
                                  child: Container(
                                      height: 310,
                                      child: Column(
                                        children: [
                                          Lottie.network(
                                            "https://assets7.lottiefiles.com/temp/lf20_5tgmik.json",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.28,
                                            fit: BoxFit.cover,
                                            repeat: false,
                                            animate: true,
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    AddressPage(FirebaseAuth.instance.currentUser!.uid)));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                backgroundColor:
                                                    HexColor('#d2e9e6'),
                                              ),
                                              child: Text(
                                                "Done",
                                                style: TextStyle(
                                                  color: Color(0xff1e9486),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                ),
                                              ))
                                        ],
                                      )),
                                ),
                              );
                },
                color: GlobalColors.primaryButtonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
