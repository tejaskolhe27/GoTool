import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer_app/screens/main_page.dart';
import 'package:flutter/material.dart';

class Profile1 extends StatelessWidget {
  Profile1(this.user, {Key? key}) : super(key: key) {
    _reference = FirebaseFirestore.instance.collection('User').doc(user);
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
    return Scaffold(
         appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xfff7f7f7),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff1e9486),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const MainPage()));
          },
        ),
        title: const Padding(
          padding: EdgeInsets.only(right: 40),
          child: Align(
            alignment: Alignment(0, 0),
            child: Text(
              "My Profile",
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
                fontSize: 18,
                color: Color(0xff1e9486),
              ),
            ),
          ),
        ),
      ),
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
            return SingleChildScrollView(
              child: Column(
            children: [
              Row(),
              Center(
                child: CircleAvatar(
                  
                  backgroundImage: NetworkImage('${data['image1']}'),
                  radius: 120,
                  
                  
                ),
              ),

              Text(
                '${data['name']}',
                style: const TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico"),
              ),

              const SizedBox(
                height: 20,
                width: 200,
                child: Divider(color: Colors.black),
              ),
              Card(
                color: const Color.fromRGBO(235, 238, 241, 1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                child: ListTile(
                  title: const Text(
                    'Date Of Birth',
                    // style: Theme.of(context).textTheme.bodyText2),
                    style: TextStyle(
                      fontFamily: 'RobotoCondensed-Bold',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1e9486),
                    ),
                  ),
                  subtitle: Text(
                    '${data['DOB']}',
                    // style: Theme.of(context).textTheme.bodyText1),
                    style: const TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontSize: 15,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
              ),
              Card(
                color: const Color.fromRGBO(235, 238, 241, 1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                child: ListTile(
                  title: const Text(
                    'Phone Number',
                    // style: Theme.of(context).textTheme.bodyText2),
                    style: TextStyle(
                      fontFamily: 'RobotoCondensed-Bold',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1e9486),
                    ),
                  ),
                  subtitle: Text(
                    '${data['phone']}',
                    // style: Theme.of(context).textTheme.bodyText1),
                    style: const TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontSize: 15,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
              ),
              Card(
                color: const Color.fromRGBO(235, 238, 241, 1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                child: ListTile(
                  title: const Text(
                    'Gender',
                    // style: Theme.of(context).textTheme.bodyText2),
                    style: TextStyle(
                      fontFamily: 'RobotoCondensed-Bold',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1e9486),
                    ),
                  ),
                  subtitle: Text(
                    '${data['Gender']}',
                    // style: Theme.of(context).textTheme.bodyText1),
                    style: const TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontSize: 15,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
              ),
              Card(
                color: const Color.fromRGBO(235, 238, 241, 1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                child: ListTile(
                  title: const Text(
                    'About',
                    // style: Theme.of(context).textTheme.bodyText2),
                    style: TextStyle(
                      fontFamily: 'RobotoCondensed-Bold',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1e9486),
                    ),
                  ),
                  subtitle: Text(
                    '${data['About']}',
                    // style: Theme.of(context).textTheme.bodyText1),
                    style: const TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontSize: 15,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
              ),
            ],
            ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
