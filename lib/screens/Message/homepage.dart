import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/screens/chat/chatroom1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:farmer_app/screens/Message/user.dart';
import 'package:farmer_app/screens/Message/Firebase_constant.dart';
import 'package:farmer_app/screens/Message/chatscreen.dart';
import 'package:farmer_app/screens/Message/chatProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ChatProvider chatProvider = ChatProvider();
  @override
  void initState() {
    // chatProvider.registerNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(FirebaseAuth.instance.currentUser!.uid);
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        // actions: <Widget>[
        //   ElevatedButton(
        //     // textColor: Colors.white,
        //     onPressed: () async {
        //       await FirebaseAuth.instance.signOut();
        //     },
        //     child: Text("Signout"),
        //     // style: const CircleBorder(side: BorderSide(color: Colors.transparent)),
        //   ),
        // ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("User")
              .where('uid',
                  isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: ((context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                UserModel user = UserModel.fromJson(snapshot.data!.docs[index]);

                return InkWell(
                  autofocus: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Chat_Screen(uid: user.uid),
                        ));
                  },
                  child: ListTile(
                    title: Text(user.userName),
                    subtitle: Text(user.userEmail),
                  ),
                );
              },
            );
          })),
    );
  }
}