import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/policies.dart';
import 'package:farmer_app/screens/Message/homepage.dart';
import 'package:farmer_app/screens/chat/chat.dart';
import 'package:farmer_app/screens/profile/deletion.dart';
import 'package:farmer_app/screens/profile/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:farmer_app/login.dart';
import 'package:farmer_app/screens/profile/helpcenter.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/constants/variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:farmer_app/screens/address/address_screen.dart';
import 'package:age_calculator/age_calculator.dart';

class Profile extends StatelessWidget {
  Profile(this.user, {Key? key}) : super(key: key) {
    _reference = FirebaseFirestore.instance.collection('User').doc(user);
    _futureData = _reference.get();
  }

  String user;
  late DocumentReference _reference;

  //_reference.get()  --> returns Future<DocumentSnapshot>
  //_reference.snapshots() --> Stream<DocumentSnapshot>
  late Future<DocumentSnapshot> _futureData;
  late Map data;

  uploadTile(
      {required String imageString,
      required String text,
      required Function() onPressed}) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.35,
            color: const Color.fromRGBO(235, 238, 241, 1),
          ),
          borderRadius: BorderRadius.circular(10.0)),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 0,
          side: const BorderSide(
            width: 0.35,
            color: Color.fromRGBO(235, 238, 241, 1),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageString),
                ),
              ),
            ),
            const SizedBox(width: 13),
            Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: Color.fromRGBO(27, 29, 34, 1),
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(child: Container()),
            const Icon(
              Icons.arrow_forward,
              size: 18.0,
              color: Color.fromRGBO(27, 29, 34, 0.25),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

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
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//===========================================

                    const SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.7,
                          color: const Color.fromRGBO(235, 238, 241, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: ClipOval(
                              child: Image.network(
                                '${data['image1']}',
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name:" + '${data['name']}',
                                style: const TextStyle(
                                  color: Color.fromRGBO(27, 29, 34, 1),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'DOB:' + '${data['DOB']}',
                                style: const TextStyle(
                                  color: Color.fromRGBO(27, 29, 34, 0.6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Phone Number:' + '${data['phone']}',
                                style: const TextStyle(
                                  color: Color.fromRGBO(27, 29, 34, 0.6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "Email: " + user.email!,
                                style: const TextStyle(
                                  color: Color.fromRGBO(27, 29, 34, 0.6),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                height: 24,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: HexColor('#d2e9e6'),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    side: const BorderSide(
                                      width: 0.1,
                                      color: Color.fromRGBO(67, 101, 205, 0.1),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EditProfile()));
                                  },
                                  child: const Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                      color: Color(0xff1e9486),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
//============================================

                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.7,
                          color: const Color.fromRGBO(235, 238, 241, 1),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    const SizedBox(height: 10),
                    uploadTile(
                      imageString: 'assets/images/order.png',
                      text: 'Deleted Items',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => deletion()
                          ),
                        );

                      },
                    ),
                    const SizedBox(height: 10),

                    const SizedBox(height: 10),
                    uploadTile(
                      imageString: 'assets/images/address.png',
                      text: 'My Address',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddressPage(
                                FirebaseAuth.instance.currentUser!.uid),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 10),
                    uploadTile(
                      imageString: 'assets/images/setting.png',
                      text: 'Settings',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                        );
                      },
                    ),

                    const SizedBox(height: 10),
                    uploadTile(
                      imageString: 'assets/images/t&c.png',
                      text: 'Policies',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const Policy()),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    uploadTile(
                      imageString: 'assets/images/help.png',
                      text: 'Help Center',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const helpcenter()));
                      },
                    ),
                    const SizedBox(height: 10),
                    uploadTile(
                      imageString: 'assets/images/logout.png',
                      text: 'Sign Out',
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const login()));
                      },
                    ),
                    // SizedBox(height: 10),
                    // uploadTile(
                    //   imageString: 'images/pill_reminder.png',
                    //   text: 'Pill Reminder',
                    //   onPressed: () {},
                    // ),
                    // SizedBox(height: 10),
                    // uploadTile(
                    //   imageString: 'images/emergency_car.png',
                    //   text: 'don',
                    //   onPressed: () {},
                    // ),
                    // SizedBox(height: 10),
                    // uploadTile(
                    //   imageString: 'images/settings.png',
                    //   text: 'Tejas ',
                    //   onPressed: () {},
                    // ),
                  ],
                ));
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
