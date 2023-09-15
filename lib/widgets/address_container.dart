// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:farmer_app/constants/colors.dart';


class AddressContainer extends StatefulWidget {
  const AddressContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<AddressContainer> createState() => _AddressContainerState();
}

class _AddressContainerState extends State<AddressContainer> {
  late DocumentReference _reference;

  //_reference.get()  --> returns Future<DocumentSnapshot>
  //_reference.snapshots() --> Stream<DocumentSnapshot>
  late Future<DocumentSnapshot> _futureData;
  late Map data;
  

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    
    _reference = FirebaseFirestore.instance.collection('address').doc(user.uid);
    _futureData = _reference.get();
    return Scaffold(
        body: FutureBuilder<DocumentSnapshot>(
            future: _futureData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text('Some error occurred ${snapshot.error}'));
              }

              if (snapshot.hasData) {
                //Get the data
                DocumentSnapshot documentSnapshot = snapshot.data;
                data = documentSnapshot.data() as Map;
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(67, 101, 205, 0.1),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${data['name']}''${data['name']}''${data['name']}',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: GlobalColors.smallText,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: '',
                                style: TextStyle(
                                  fontSize: 9.5,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
