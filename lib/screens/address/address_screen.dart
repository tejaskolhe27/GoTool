import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/screens/address/addtrail2.dart';
import 'package:farmer_app/widgets/information_box.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AddressPage extends StatelessWidget {
  AddressPage(this.user, {Key? key}) : super(key: key) {
    _reference = FirebaseFirestore.instance.collection('address').doc(user);
    _futureData = _reference.get();
  }

  String user;
  late DocumentReference _reference;

  //_reference.get()  --> returns Future<DocumentSnapshot>
  //_reference.snapshots() --> Stream<DocumentSnapshot>
  late Future<DocumentSnapshot> _futureData;
  late Map data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            //Get the data
            DocumentSnapshot documentSnapshot = snapshot.data;
            data = documentSnapshot.data() as Map;

            //display the data
            return Scaffold(
              backgroundColor: GlobalColors.backgroundColor,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 36),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          const Padding(padding: EdgeInsets.all(7.0)),
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
                      const SizedBox(height: 20),
                      RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Choose your ",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            TextSpan(
                              text: "Location",
                              style: TextStyle(
                                  fontSize: 19,
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
                        "Enter PIN code to check the availability of service",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            //height: 23,
                            fontFamily: 'Inter',
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 350,
                            height: 270,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/address1.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          const SizedBox(height: 25,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const AddtrailPage(),
                                ),
                              );
                            },
                            child: Container(
                              height: size.height * 0.21,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: HexColor('#e8f4f2'),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Your Address :',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '${data['name']}'
                                      ','
                                      ,
                                      style: TextStyle(
                                        color: HexColor('#1B1D22'),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '${data['address']}'
                                      ', '
                                      '${data['street']}',
                                      style: TextStyle(
                                        color: HexColor('#1B1D22'),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '${data['locality']}'
                                      ', '
                                      ,
                                      style: TextStyle(
                                        color: HexColor('#1B1D22'),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '${data['state']}',
                                      style: TextStyle(
                                        color: HexColor('#1B1D22'),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '${data['pincode']}',
                                      style: TextStyle(
                                        color: HexColor('#1B1D22'),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24),
                      const InformationBox(
                        imageString: 'assets/images/shield_tick.png',
                        text:
                            'We use your addresses only for purchases, \ndelivery purposes',
                        topLeft: Radius.circular(9),
                        topRight: Radius.circular(9),
                        bottomLeft: Radius.circular(9),
                        bottomRight: Radius.circular(9),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
