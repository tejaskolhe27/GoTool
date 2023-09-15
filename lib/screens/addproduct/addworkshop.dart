import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:farmer_app/screens/addproduct/failed.dart';
import 'package:farmer_app/screens/addproduct/success.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class AddWorkshop extends StatefulWidget {
  const AddWorkshop({Key? key}) : super(key: key);

  @override
  State<AddWorkshop> createState() => _AddWorkshopState();
}

class _AddWorkshopState extends State<AddWorkshop> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();
  TextEditingController _controllerRent = TextEditingController();
  TextEditingController _controllerDeposit = TextEditingController();

  List<String> items = [
    'Automotive',
    "Big-Workshop",
    "Cleaning",
    "Compressors",
    "Material",
    "Welding"
  ];

  String selectedItem = 'Automotive';

  GlobalKey<FormState> key = GlobalKey();
  final user = FirebaseAuth.instance.currentUser!;

  CollectionReference _reference =
      FirebaseFirestore.instance.collection('Products');

  String image1Url = '';
  String image2Url = '';
  String image3Url = '';
  String image4Url = '';

  //File? pickedImage;
  File? pickedImage1;
  File? pickedImage2;
  File? pickedImage3;
  File? pickedImage4;

  late var _razorpay;
  @override
  void initState() {
    // TODO: implement initState
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    String itemName = _controllerName.text;
    String itemDescription = _controllerDescription.text;
    String itemRent = _controllerRent.text;
    String itemDeposit = _controllerDeposit.text;
    String? email = user.email;
    String? uid = user.uid;
    String id =
        _reference.doc("Workshop").collection(selectedItem.toString()).doc().id;
    // Do something when payment succeeds
    _reference.doc("Workshop").collection(selectedItem.toString()).doc(id).set({
      "image1": image1Url,
      "image2": image2Url,
      "image3": image3Url,
      "image4": image4Url,
      "desc": itemDescription,
      "id": id,
      "depositep": itemDeposit,
      "rentp": itemRent,
      "uid": user.uid.toString(),
      "name": itemName,
    });
    Navigator.push(context, MaterialPageRoute(builder: (_) => const success()));
    print("Payment Success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Navigator.push(context, MaterialPageRoute(builder: (_) => const failed()));
    print("Payment Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: key,
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(height: 80),
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
                    const SizedBox(width: 8),
                    const Text(
                      "Add Product",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(20, 22, 28, 0.7),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "WORKSHOP",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            color: Color(0xff1e9486),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "----------------------------------------------------------------------------",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: GlobalColors.smallText,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Product  Details",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: GlobalColors.smallText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Enter your product details",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: GlobalColors.smallText,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 18),
// ============================ camera =========================================================
                Column(children: [
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          margin: const EdgeInsets.all(0),
                          child: Container(
                              margin: const EdgeInsets.all(0),
                              child: 
                              
                              
                               
                               
                               GestureDetector(
                                onTap: () async {
                                  try {
                                    ImagePicker imagePicker = ImagePicker();
                                    final photo = await imagePicker.pickImage(
                                        source: ImageSource.camera);
                                    if (photo == null) return;
                                    final tempImage1 = File(photo.path);
                                    setState(() {
                                      pickedImage1 = tempImage1;
                                    });
                                    String uniqueFileName = DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString();
                                    Reference referenceRoot =
                                        FirebaseStorage.instance.ref();
                                    Reference referenceDirImages =
                                        referenceRoot.child('images');

                                    //Create a reference for the image to be stored
                                    Reference referenceImageToUpload =
                                        referenceDirImages
                                            .child(uniqueFileName);
                                    await referenceImageToUpload
                                        .putFile(File(photo.path));
                                    image1Url = await referenceImageToUpload
                                        .getDownloadURL();
                                    //Get.back();
                                  } catch (error) {
                                    debugPrint(error.toString());
                                  }
                                },
                                child: pickedImage1 != null
                                    ? Image.file(
                                        pickedImage1!,
                                        // width: 170,
                                        // height: 170,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset('assets/images/front.png'),
                              )),
                        ),

                        const SizedBox(width: 20),

//------------------------------------------------------------- image 2 ------------------------------------------------------
                        Container(
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          margin: const EdgeInsets.all(0),
                          child: Container(
                              width: 120,
                              margin: const EdgeInsets.all(0),
                              child: GestureDetector(
                                onTap: () async {
                                  try {
                                    ImagePicker imagePicker = ImagePicker();
                                    final photo = await imagePicker.pickImage(
                                        source: ImageSource.camera);
                                    if (photo == null) return;
                                    final tempImage2 = File(photo.path);
                                    setState(() {
                                      pickedImage2 = tempImage2;
                                    });
                                    String uniqueFileName = DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString();
                                    Reference referenceRoot =
                                        FirebaseStorage.instance.ref();
                                    Reference referenceDirImages =
                                        referenceRoot.child('images');

                                    //Create a reference for the image to be stored
                                    Reference referenceImageToUpload =
                                        referenceDirImages
                                            .child(uniqueFileName);
                                    await referenceImageToUpload
                                        .putFile(File(photo.path));
                                    image2Url = await referenceImageToUpload
                                        .getDownloadURL();
                                    //Get.back();
                                  } catch (error) {
                                    debugPrint(error.toString());
                                  }
                                },
                                child: pickedImage2 != null
                                    ? Image.file(
                                        pickedImage2!,
                                        // width: 170,
                                        // height: 170,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset('assets/images/back.png'),
                              )),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          margin: const EdgeInsets.all(0),
                          child: Container(
                              margin: const EdgeInsets.all(0),
                              child: GestureDetector(
                                onTap: () async {
                                  try {
                                    ImagePicker imagePicker = ImagePicker();
                                    final photo = await imagePicker.pickImage(
                                        source: ImageSource.camera);
                                    if (photo == null) return;
                                    final tempImage3 = File(photo.path);
                                    setState(() {
                                      pickedImage3 = tempImage3;
                                    });
                                    String uniqueFileName = DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString();
                                    Reference referenceRoot =
                                        FirebaseStorage.instance.ref();
                                    Reference referenceDirImages =
                                        referenceRoot.child('images');

                                    //Create a reference for the image to be stored
                                    Reference referenceImageToUpload =
                                        referenceDirImages
                                            .child(uniqueFileName);
                                    await referenceImageToUpload
                                        .putFile(File(photo.path));
                                    image3Url = await referenceImageToUpload
                                        .getDownloadURL();
                                    //Get.back();
                                  } catch (error) {
                                    debugPrint(error.toString());
                                  }
                                },
                                child: pickedImage3 != null
                                    ? Image.file(
                                        pickedImage3!,
                                        // width: 170,
                                        // height: 170,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset('assets/images/left.png'),
                              )),
                        ),

                        const SizedBox(width: 20),

//------------------------------------------------------------- image 2 ------------------------------------------------------
                        Container(
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade400,
                            ),
                          ),
                          margin: const EdgeInsets.all(0),
                          child: Container(
                              width: 120,
                              margin: const EdgeInsets.all(0),
                              child: GestureDetector(
                                onTap: () async {
                                  try {
                                    ImagePicker imagePicker = ImagePicker();
                                    final photo = await imagePicker.pickImage(
                                        source: ImageSource.camera);
                                    if (photo == null) return;
                                    final tempImage4 = File(photo.path);
                                    setState(() {
                                      pickedImage4 = tempImage4;
                                    });
                                    String uniqueFileName = DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString();
                                    Reference referenceRoot =
                                        FirebaseStorage.instance.ref();
                                    Reference referenceDirImages =
                                        referenceRoot.child('images');

                                    //Create a reference for the image to be stored
                                    Reference referenceImageToUpload =
                                        referenceDirImages
                                            .child(uniqueFileName);
                                    await referenceImageToUpload
                                        .putFile(File(photo.path));
                                    image4Url = await referenceImageToUpload
                                        .getDownloadURL();
                                    //Get.back();
                                  } catch (error) {
                                    debugPrint(error.toString());
                                  }
                                },
                                child: pickedImage4 != null
                                    ? Image.file(
                                        pickedImage4!,
                                        // width: 170,
                                        // height: 170,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset('assets/images/right.png'),
                              )),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ])
                ]),

                const SizedBox(height: 15),

//============================== ======================= Name =============================================================================

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: "Name ",
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
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(241, 241, 241, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _controllerName,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(27, 29, 34, 0.9),
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 14),
                          hintText: 'e.g. Tractor',
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
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the item Name';
                          }

                          return null;
                        },
                      ),
                    ),
                  ],
                ),
//============================================================ Description ===========================================================
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: "Description ",
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
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(241, 241, 241, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: _controllerDescription,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(27, 29, 34, 0.9),
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 14),
                          hintText: 'e.g. Tractor',
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
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the item Description';
                          }

                          return null;
                        },
                      ),
                    ),
                  ],
                ),
//======================================== rent ==========================================================================================
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: "Rent ",
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
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(241, 241, 241, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: _controllerRent,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(27, 29, 34, 0.9),
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 14),
                          hintText: 'e.g. 500',
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
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the item rent amount';
                          }

                          return null;
                        },
                      ),
                    ),
                  ],
                ),
//================================================================= Deposit ==========================================================
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: "Deposit ",
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
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(241, 241, 241, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: _controllerDeposit,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(27, 29, 34, 0.9),
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 14),
                          hintText: 'e.g. 10000',
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
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the item deposit amount';
                          }

                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                //========================================================================================================================================
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Categories',
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
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(241, 241, 241, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedItem,
                        underline: Container(
                          color: Colors.transparent,
                        ),
                        style: const TextStyle(
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
                    const SizedBox(height: 14),
                  ],
                ),
                const SizedBox(height: 20),
                //===============================================================================================================
                //===============================================================================================================
                //===============================================================================================================
                //===============================================================================================================
                //===============================================================================================================
                //===============================================================================================================
                //===============================================================================================================
                //===============================================================================================================

                Column(children: [
                  Container(
                    child: Column(
                      children: [
                        //====================================================

                        ElevatedButton(
                          onPressed: () {
                            if (image1Url.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please upload an Front image')));

                              return;
                            }
                            if (image2Url.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Please upload an Back image')));

                              return;
                            }
                            if (image3Url.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please upload an  Left image')));

                              return;
                            }
                            if (image4Url.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please upload an Right image')));

                              return;
                            }
                            if (_controllerName.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Specify the product Name')));

                              return;
                            }
                            if (_controllerDescription.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Specify the product Decription')));

                              return;
                            }
                            if (_controllerRent.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Specify the product Rent')));

                              return;
                            }
                            if (_controllerDeposit.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Specify the product Deposit')));

                              return;
                            }

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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 22.0, vertical: 22),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: 146,
                                                ),
                                                const CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      "assets/images/alert.png"),
                                                  radius: 25,
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 15),
                                            RichText(
                                              text: const TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Alert!',
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
                                            const SizedBox(height: 8),
                                            const Text(
                                              'Ensure that all the details below are filled in correctly.',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: GlobalColors.smallText,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            const Text(
                                              'There is a fee of just ₹25 to add your tool for rent to GoTool',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: GlobalColors.smallText,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const Divider(
                                                color: GlobalColors.smallText,
                                                thickness: 0.4),
                                            const SizedBox(height: 18),
                                            Container(
                                              width: 300,
                                              //height: 230,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey.shade400,
                                                ),
                                              ),
                                              margin: const EdgeInsets.all(0),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 8),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          const TextSpan(
                                                            text: 'Images :',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: GlobalColors
                                                                  .smallText,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                              text:
                                                                  'Click here to view Uploaded Images',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 13,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        67,
                                                                        101,
                                                                        205,
                                                                        1),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                              recognizer:
                                                                  TapGestureRecognizer()
                                                                    ..onTap =
                                                                        () {
                                                                      showModalBottomSheet<
                                                                          dynamic>(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.white,
                                                                        context:
                                                                            context,
                                                                        shape:
                                                                            const RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.vertical(
                                                                            top:
                                                                                Radius.circular(20.0),
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context) {
                                                                          return Wrap(
                                                                            children: [
                                                                              SingleChildScrollView(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22),
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      const SizedBox(height: 15),

                                                                                      RichText(
                                                                                        text: const TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: 'Images',
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
                                                                                        'Check all four of your uploaded images',
                                                                                        style: TextStyle(
                                                                                          fontSize: 13,
                                                                                          color: GlobalColors.smallText,
                                                                                          fontWeight: FontWeight.w400,
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(height: 5),

                                                                                      const Divider(color: GlobalColors.smallText, thickness: 0.4),
                                                                                      const SizedBox(height: 18),
                                                                                      // SizedBox(
                                                                                      //   height: MediaQuery.of(context)
                                                                                      //           .size
                                                                                      //           .height *
                                                                                      //       0.3,

                                                                                      // ),

                                                                                      Container(
                                                                                        //width: 230,
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
                                                                                          children: [
                                                                                            CarouselSlider(
                                                                                              items: [
                                                                                                Container(
                                                                                                  margin: const EdgeInsets.all(6.0),
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  child: pickedImage1 != null
                                                                                                      ? Image.file(
                                                                                                          pickedImage1!,
                                                                                                          fit: BoxFit.fill,
                                                                                                        )
                                                                                                      : Image.asset('assets/images/gallary.jpg'),
                                                                                                ),

                                                                                                //2nd Image of Slider
                                                                                                Container(
                                                                                                  margin: const EdgeInsets.all(6.0),
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  child: pickedImage2 != null
                                                                                                      ? Image.file(
                                                                                                          pickedImage2!,
                                                                                                          fit: BoxFit.fill,
                                                                                                        )
                                                                                                      : Image.asset('assets/images/gallary.jpg'),
                                                                                                ),

                                                                                                //3rd Image of Slider
                                                                                                Container(
                                                                                                  margin: const EdgeInsets.all(6.0),
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  child: pickedImage3 != null
                                                                                                      ? Image.file(
                                                                                                          pickedImage3!,
                                                                                                          fit: BoxFit.fill,
                                                                                                        )
                                                                                                      : Image.asset('assets/images/gallary.jpg'),
                                                                                                ),

                                                                                                //4th Image of Slider
                                                                                                Container(
                                                                                                  margin: const EdgeInsets.all(6.0),
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  child: pickedImage4 != null
                                                                                                      ? Image.file(
                                                                                                          pickedImage4!,
                                                                                                          fit: BoxFit.fill,
                                                                                                        )
                                                                                                      : Image.asset('assets/images/gallary.jpg'),
                                                                                                ),
                                                                                              ],
                                                                                              options: CarouselOptions(
                                                                                                height: 220.0,
                                                                                                enlargeCenterPage: false,
                                                                                                autoPlay: true,
                                                                                                aspectRatio: 16 / 8,
                                                                                                autoPlayCurve: Curves.fastOutSlowIn,
                                                                                                enableInfiniteScroll: true,
                                                                                                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                                                                                viewportFraction: 1,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),

                                                                                      Container(
                                                                                        color: GlobalColors.backgroundColor,
                                                                                        margin: const EdgeInsets.only(top: 22),
                                                                                        child: ElevatedButton(
                                                                                          child: const Text(
                                                                                            'Confirmed Images',
                                                                                            style: TextStyle(
                                                                                              color: Color.fromARGB(255, 255, 255, 255),
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontSize: 13,
                                                                                            ),
                                                                                          ),
                                                                                          onPressed: () {
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          style: ElevatedButton.styleFrom(
                                                                                              elevation: 0,
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                              ),
                                                                                              minimumSize: const Size(double.infinity, 50),
                                                                                              backgroundColor: const Color(0xff1e9486)),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                          ;
                                                                          // return SelectedMedicineAlternative();
                                                                        },
                                                                      );
                                                                    }),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 3),
                                                    const SizedBox(height: 8),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          const TextSpan(
                                                            text:
                                                                'Product Name :',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: GlobalColors
                                                                  .smallText,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                _controllerName
                                                                    .text,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 3),
                                                    const SizedBox(height: 8),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          const TextSpan(
                                                            text:
                                                                'Description :',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: GlobalColors
                                                                  .smallText,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                _controllerDescription
                                                                    .text,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 3),
                                                    const SizedBox(height: 8),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          const TextSpan(
                                                            text: 'Rent :',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: GlobalColors
                                                                  .smallText,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                _controllerRent
                                                                    .text,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 3),
                                                    const SizedBox(height: 8),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          const TextSpan(
                                                            text: 'Deposit :',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: GlobalColors
                                                                  .smallText,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                _controllerDeposit
                                                                    .text,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 3),
                                                    const SizedBox(height: 8),
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          const TextSpan(
                                                            text: 'Category :',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: GlobalColors
                                                                  .smallText,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: selectedItem,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 3),
                                                  ]),
                                            ),
                                            Container(
                                              color:
                                                  GlobalColors.backgroundColor,
                                              margin: const EdgeInsets.only(
                                                  top: 22),
                                              child: ElevatedButton(
                                                child: const Text(
                                                  'Procced to Pay',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  var options = {
                                                    'key':
                                                        "rzp_test_OJs4YIgbc7KwWF",
                                                    // amount will be multiple of 100
                                                    'amount': (int.parse("25") *
                                                            100)
                                                        .toString(), //So its pay 500
                                                    'name': "GoTool",
                                                    'description':
                                                        "_controllerRent",
                                                    'timeout':
                                                        300, // in seconds
                                                    'prefill': {
                                                      'contact': '7066586280',
                                                      'email':
                                                          'goorganinsation23@gmail.com'
                                                    }
                                                  };
                                                  _razorpay.open(options);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    minimumSize: const Size(
                                                        double.infinity, 50),
                                                    backgroundColor:
                                                        const Color(
                                                            0xff1e9486)),
                                              ),
                                            ),
                                            Container(
                                              color:
                                                  GlobalColors.backgroundColor,
                                              margin: const EdgeInsets.only(
                                                  top: 22),
                                              child: ElevatedButton(
                                                child: const Text(
                                                  'Cancel Post',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  minimumSize: const Size(
                                                      double.infinity, 50),
                                                  primary: const Color.fromRGBO(
                                                      210, 82, 82, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                                // ignore: dead_code
                                
                                // return SelectedMedicineAlternative();
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: const Color(0xff1e9486),
                          ),
                          child: const Text(
                            "Add Product",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ])
              ],
            )),
      ),
    );
  }
}
