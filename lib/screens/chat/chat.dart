import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/screens/chat/chatroom1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class chat extends StatefulWidget {
  chat({Key? key}) : super(key: key) {
    _stream = (FirebaseFirestore.instance
        .collection('User')
        .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots());
  }

  late DocumentReference _reference;
  late Stream<QuerySnapshot> _stream;

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Stack(
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'My ',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: "Chats",
                    style: TextStyle(
                      fontSize: 19,
                      color: GlobalColors.primaryButtonColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: widget._stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //Check error
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          //Check if data arrived
          if (snapshot.hasData) {
            //get the data
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            //Convert the documents to Maps
            List<Map> items = documents.map((e) => e.data() as Map).toList();

            //Display the lis

            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  //Get the item at this index
                  Map thisItem = items[index];

                  return Container(
                    height: 80,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.35,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(10.0)),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shape: StadiumBorder(),
                        elevation: 0,
                      ),
                      onPressed: () {
                        String roomId =
                            chatRoomId(_auth.currentUser!.uid, thisItem['uid']);

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              ChatRoom(chatRoomId: roomId, userMap: thisItem),
                        ));
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            // height: 40,
                            // width: 40,
                            // decoration: BoxDecoration(
                            //   image: DecorationImage(
                            //     image: NetworkImage('${thisItem['image1']}'),
                            //   ),
                            // ),
                            radius: 23,
                            backgroundImage:
                                NetworkImage('${thisItem['image1']}'),
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(width: 13),
                          Text('${thisItem['name']}',
                              style: GoogleFonts.ptSerif(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 79, 82, 84),
                                      letterSpacing: .5))),
                          Expanded(child: Container()),
                          const Icon(
                            Icons.message_outlined,
                            size: 18.0,
                            color: Color.fromRGBO(7, 157, 12, 1),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
                  );
                });
          }

          //Show loader
          return const Center(child: CircularProgressIndicator());
        },
      ), //Display a list // Add a FutureBuilder
    );
  }
}
