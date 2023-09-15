// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/screens/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerphone = TextEditingController();
  TextEditingController _controllerabout = TextEditingController();
  TextEditingController _controllergender = TextEditingController();

    List<String> gender = [
    'Male',
    "Female",

  ];

  String selectedItem = 'Male';



  GlobalKey<FormState> key = GlobalKey();
  final user = FirebaseAuth.instance.currentUser!;

  CollectionReference _reference =
      FirebaseFirestore.instance.collection('User');
  String image1Url = '';
  File? pickedImage1;

  late DateTime _dateTime;
  String time = "Select date";

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
                style: TextStyle(
                  fontSize: 12,
                  color: GlobalColors.smallText,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
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
                  controller: controller2,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText2,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: UnderlineInputBorder(
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

  customField3(String text, TextEditingController controller, String hintText) {
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
            maxLines: 4,
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

  uploadTile(
      {required String imageString,
      required String text,
      required Function() onPressed}) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.7,
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(10.0)),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageString),
                ),
              ),
            ),
            SizedBox(width: 14),
            Text(
              text,
              style: TextStyle(
                  fontSize: 12,
                  color: GlobalColors.smallText,
                  fontWeight: FontWeight.w400),
            ),
            Expanded(child: Container()),
            Icon(
              Icons.arrow_forward,
              size: 20.0,
              color: Color.fromRGBO(27, 29, 34, 0.35),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
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
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: "Personal",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: "  Details",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 20,
                                color: Color(0xff1e9486),
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      color: GlobalColors.smallText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              ///+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

              Column(
                children: [
                  Column(
                    children: [
                      DottedBorder(
                        // borderType: BorderType.RRect,
                        // radius: Radius.circular(10),
                        // padding: EdgeInsets.symmetric(vertical: 14),
                        // color: Color.fromRGBO(27, 29, 34, 0.4),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
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
                                      return Wrap(
                                        children: [
                                          SingleChildScrollView(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 22.0,
                                                      vertical: 22),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child: Icon(
                                                          Icons.arrow_back,
                                                          color: GlobalColors
                                                              .iconColor,
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
                                                          text: 'Select ',
                                                          style: TextStyle(
                                                            fontSize: 19,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: 'Profile ',
                                                          style: TextStyle(
                                                            fontSize: 19,
                                                            color: GlobalColors
                                                                .primaryButtonColor,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    'Choose method to upload your Profile Photo',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: GlobalColors
                                                          .smallText,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(height: 26),
                                                  uploadTile(
                                                    text:
                                                        'Take photo using Camera',
                                                    imageString:
                                                        'assets/images/camera.png',
                                                    onPressed: () async {
                                                      try {
                                                        ImagePicker
                                                            imagePicker =
                                                            ImagePicker();
                                                        final photo = await imagePicker
                                                            .pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .camera);
                                                        if (photo == null)
                                                          return;
                                                        final tempImage1 =
                                                            File(photo.path);
                                                        setState(() {
                                                          pickedImage1 =
                                                              tempImage1;
                                                        });
                                                        String uniqueFileName =
                                                            DateTime.now()
                                                                .millisecondsSinceEpoch
                                                                .toString();
                                                        Reference
                                                            referenceRoot =
                                                            FirebaseStorage
                                                                .instance
                                                                .ref();
                                                        Reference
                                                            referenceDirImages =
                                                            referenceRoot
                                                                .child('Users');

                                                        //Create a reference for the image to be stored
                                                        Reference
                                                            referenceImageToUpload =
                                                            referenceDirImages
                                                                .child(
                                                                    uniqueFileName);
                                                        await referenceImageToUpload
                                                            .putFile(File(
                                                                photo.path));

                                                        image1Url =
                                                            await referenceImageToUpload
                                                                .getDownloadURL();

                                                        print(image1Url);
                                                        //Get.back();
                                                      } catch (error) {
                                                        debugPrint(
                                                            error.toString());
                                                      }
                                                    },
                                                  ),
                                                  SizedBox(height: 14),
                                                  uploadTile(
                                                    text:
                                                        'Select photo from Gallery',
                                                    imageString:
                                                        'assets/images/gallary.png',
                                                    onPressed: () async {
                                                      try {
                                                        ImagePicker
                                                            imagePicker =
                                                            ImagePicker();
                                                        final photo = await imagePicker
                                                            .pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .gallery);
                                                        if (photo == null)
                                                          return;
                                                        final tempImage1 =
                                                            File(photo.path);
                                                        setState(() {
                                                          pickedImage1 =
                                                              tempImage1;
                                                        });
                                                        String uniqueFileName =
                                                            DateTime.now()
                                                                .millisecondsSinceEpoch
                                                                .toString();
                                                        Reference
                                                            referenceRoot =
                                                            FirebaseStorage
                                                                .instance
                                                                .ref();
                                                        Reference
                                                            referenceDirImages =
                                                            referenceRoot
                                                                .child('Users');

                                                        //Create a reference for the image to be stored
                                                        Reference
                                                            referenceImageToUpload =
                                                            referenceDirImages
                                                                .child(
                                                                    uniqueFileName);
                                                        await referenceImageToUpload
                                                            .putFile(File(
                                                                photo.path));

                                                        image1Url =
                                                            await referenceImageToUpload
                                                                .getDownloadURL();

                                                        print(image1Url);
                                                        //Get.back();
                                                      } catch (error) {
                                                        debugPrint(
                                                            error.toString());
                                                      }
                                                    },
                                                  ),
                                                  SizedBox(height: 24),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      minimumSize: Size(
                                                          double.infinity, 50),
                                                      backgroundColor:
                                                          Color(0xff1e9486),
                                                    ),
                                                    child: Text(
                                                      "Done Uploading",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 16),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );

                                      // return SelectedMedicineAlternative();
                                    },
                                  );
                                },
                       
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.transparent,
                                  child: pickedImage1 != null
                                      ? Image.file(
                                          pickedImage1!,
                                          width: 170,
                                          height: 170,
                                          fit: BoxFit.fill,
                                        )
                                      : Image.asset('assets/images/user.png'),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Upload Profile',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  customField("Deliver to ", _controllerName, "eg. Tejas Kolhe"),
                  SizedBox(height: 14),
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
                                  primary: HexColor('#d2e9e6'),
                                ),
                                onPressed: () async {
                                  _dateTime = (await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1960),
                                      lastDate: DateTime(2030)))!;

                                  setState(() {
                                    time = DateFormat('dd-MM-yy')
                                        .format(_dateTime);

                                    print(time);
                                  });
                                },
                                child: Text(
                                  "Select",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: HexColor("#1e9486"),
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
                  customField2("Phone Number", _controllerphone, "eg. 932576680"),
                  SizedBox(height: 14),
                    Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 14),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Gender',
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
                        items: gender
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
                  ],
                ),
                  SizedBox(height: 14),
                  customField3("About", _controllerabout, ""),
                  SizedBox(height: 14),
                  ElevatedButton(
                    onPressed: () async {
                      if (key.currentState!.validate()) {
                        String userName = _controllerName.text;
                        String userPhone = _controllerphone.text;
                        String usergender = _controllergender.text;
                        String userabout = _controllerabout.text;

                        String? uid = user.uid;
                        String? email = user.email;

                        //Create a Map of data

                        //Add a new item
                        _reference.doc(uid).set({
                          'uid': uid,
                          'image1': image1Url,
                          'name': userName,
                          'phone': userPhone,
                          'DOB': time,
                          'Gender': selectedItem,
                          'About': userabout,
                          "email": email,
                        });
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MainPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Color(0xff1e9486),
                    ),
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
