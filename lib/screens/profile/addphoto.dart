// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:farmer_app/constants/colors.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({Key? key}) : super(key: key);

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

String imageUrl = '';
pickImage() async {
  ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
  print('${file?.path}');

  if (file == null) return;
  //Import dart:core
  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

  Reference referenceRoot = FirebaseStorage.instance.ref();
  Reference referenceDirImages = referenceRoot.child('user');

  Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

  //Handle errors/success
  try {
    //Store the file
    await referenceImageToUpload.putFile(File(file.path));
    //Success: get the download URL
    imageUrl = await referenceImageToUpload.getDownloadURL();
  } catch (error) {
    //Some error occurred
  }
}

clickImage() async {
  ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
  print('${file?.path}');

  if (file == null) return;
  //Import dart:core
  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

  Reference referenceRoot = FirebaseStorage.instance.ref();
  Reference referenceDirImages = referenceRoot.child('user');

  Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

  //Handle errors/success
  try {
    //Store the file
    await referenceImageToUpload.putFile(File(file.path));
    //Success: get the download URL
    imageUrl = await referenceImageToUpload.getDownloadURL();

    Get.back();
  } catch (error) {
    //Some error occurred
  }
}

class _AddPhotoState extends State<AddPhoto> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerDob = TextEditingController();
  TextEditingController _controllerphone = TextEditingController();
  TextEditingController _controllergender = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();
  final user = FirebaseAuth.instance.currentUser!;

  CollectionReference _reference =
      FirebaseFirestore.instance.collection('user');

  String imageUrl = '';

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
    return Wrap(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                        text: 'Select ',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'Profile ',
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
                  'Choose method to upload your Profile Photo',
                  style: TextStyle(
                    fontSize: 13,
                    color: GlobalColors.smallText,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 26),
                uploadTile(
                  text: 'Take photo using Camera',
                  imageString: 'assets/images/camera.png',
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => pickImage()));
                  },
                ),
                SizedBox(height: 14),
                uploadTile(
                  text: 'Select photo from Gallery',
                  imageString: 'assets/images/gallery.png',
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => clickImage()));
                  },
                ),
                SizedBox(height: 24),
                // OrDivider(),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
