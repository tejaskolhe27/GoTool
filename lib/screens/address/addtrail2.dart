import 'package:farmer_app/screens/address/address_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';

import '../../constants/colors.dart';

class AddtrailPage extends StatefulWidget {
  const AddtrailPage({Key? key}) : super(key: key);

  @override
  State<AddtrailPage> createState() => _AddtrailPageState();
}

class _AddtrailPageState extends State<AddtrailPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController localityController = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();
  final user = FirebaseAuth.instance.currentUser!;

  CollectionReference _reference =
      FirebaseFirestore.instance.collection('address');

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
                style: const TextStyle(
                  fontSize: 12,
                  color: GlobalColors.smallText,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const TextSpan(
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
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(241, 241, 241, 1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 14),
              hintText: hintText,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Field is Empty';
              }

              return null;
            },
          ),
        ),
      ],
    );
  }

  customField2(
      String text1, TextEditingController controller2, String hintText2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: text1,
                style: const TextStyle(
                  fontSize: 12,
                  color: GlobalColors.smallText,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const TextSpan(
                text: " * ",
                style: TextStyle(
                  fontSize: 14,
                  color: GlobalColors.primaryButtonColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(241, 241, 241, 1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
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
                  controller: controller2,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText2,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Phone Number';
                    }

                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        
        child: Padding(
          
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 36),
          child: Form(
            key: key,
            child: Column(children: [
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: GlobalColors.iconColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: const TextSpan(
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
                                color: Color(0xff1e9486),
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Enter your address details for delivery and contact purpose",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      color: GlobalColors.smallText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              ///+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

              Column(
                children: [
                  customField("Deliver to ", nameController, "eg. Tejas Kolhe"),
                  const SizedBox(height: 14),
                  customField2("Phone Number", phoneController, "eg. 932576680"),
                  const SizedBox(height: 14),
                  customField("Address(House No./Building Name",
                      AddressController, "eg. Trimurti View"),
                  const SizedBox(height: 14),
                  customField(
                      "Street Name ", streetController, "eg. Sanpada Rd."),
                  const SizedBox(height: 14),
                  customField(
                      "Locality", localityController, "eg. Navi Mumbai"),
                  const SizedBox(height: 14),
                  customField("Pincode", pinCodeController, "eg. 425308"),
                  const SizedBox(height: 14),
                  ElevatedButton(
                      onPressed: () async {
                        if (key.currentState!.validate()) {
                          String userName = nameController.text;
                          String userPhone = phoneController.text;
                          String userAddress = AddressController.text;
                          String userStreet = streetController.text;
                          String userLocality = localityController.text;
                          String userPincode = pinCodeController.text;
                          String? uid = user.uid;

                          //Create a Map of data

                          //Add a new item
                          _reference.doc(uid).set({
                            'uid': uid,
                            'name': userName,
                            'phone': userPhone,
                            'address': userAddress,
                            'street': userStreet,
                            'locality': userLocality,
                            'pincode': userPincode,
                          });
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
                                              child: const Text(
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
                             style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor:const Color(0xff1e9486),
                    ),
                    child: const Text(
                      "Add Address",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
