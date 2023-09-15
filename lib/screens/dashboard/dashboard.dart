// import 'package:farmer_app/farm.dart';

import 'package:farmer_app/outdoor.dart';
import 'package:farmer_app/screens/Products/Farms/Big_machines.dart';
import 'package:farmer_app/screens/Products/Farms/cultivators.dart';
import 'package:farmer_app/screens/Products/Farms/fogging.dart';
import 'package:farmer_app/screens/Products/Farms/harvesters.dart';
import 'package:farmer_app/screens/Products/Farms/special.dart';
import 'package:farmer_app/screens/Products/Farms/sprayers.dart';
import 'package:farmer_app/screens/Products/Outdoor/Solar_products.dart';
import 'package:farmer_app/screens/Products/Outdoor/construction.dart';
import 'package:farmer_app/screens/Products/Outdoor/landscape.dart';
import 'package:farmer_app/screens/Products/Workshop/Compressors.dart';
import 'package:farmer_app/screens/Products/Workshop/automotive.dart';
import 'package:farmer_app/screens/Products/Workshop/big_workshop.dart';
import 'package:farmer_app/screens/Products/Workshop/cleaning.dart';
import 'package:farmer_app/screens/Products/Workshop/welding.dart';
import 'package:farmer_app/sidebar.dart';
import 'package:farmer_app/farm.dart';
import 'package:farmer_app/workshop.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebar(),
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 60,
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 270,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/pg1.png"),
                    fit: BoxFit.fill)),
          ),

// ----------------------------------------------------------- Farming Equipment -------------------------------------------------------------
          Container(
            width: 200,
            height: 150,
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: AssetImage("assets/images/farming.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // FARMER TOOLS

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(246, 231, 234, 239),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Special()));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/manual.png",
                                width: 100, height: 75),
                            // Icon(
                            //   Icons.settings,
                            //   size: 20,
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("Special Tools"),
                            ),
                          ]),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(246, 231, 234, 239),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Sprayers()));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/sprayers.png",
                                width: 100, height: 75),

                            // Ico
                            // (
                            //   Icons.settings,
                            //   size: 20,
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("Sprayers"),
                            ),
                          ]),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(246, 231, 234, 239),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Cultivators(),
                        ));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/pump.png",
                                width: 100, height: 70),

                            // Icon(
                            //   Icons.settings,
                            //   size: 20,
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("Cultivators|Tillers|Weeders"),
                            ),
                          ]),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(246, 231, 234, 239),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => fogging(),
                        ));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/fogging.png",
                                width: 100, height: 70),
                            // Icon(
                            //   Icons.settings,
                            //   size: 20,
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("Fogging Machine"),
                            ),
                          ]),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(246, 231, 234, 239),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Harvester()),
                        );
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/harvester.png",
                                width: 120, height: 85),
                            // Icon(
                            //   Icons.settings,
                            //   size: 20,
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("Harvesters"),
                            ),
                          ]),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(246, 231, 234, 239),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Big_Machines(),
                        ));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/bigmachine.png",
                                width: 100, height: 70),
                            // Icon(
                            //   Icons.settings,
                            //   size: 20,
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("Big Farm Machinery"),
                            ),
                          ]),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
// ---------------------------------------------------------------- Outpoor Power Equipment ----------------------------------------------------------------------------
          Container(
            width: 200,
            height: 150,
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: AssetImage("assets/images/outdoor.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // FARMER TOOL
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(246, 231, 234, 239),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Construction(),
                        ));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/construction.png",
                                width: 100, height: 70),
                            // Icon(
                            //   Icons.settings,
                            //   size: 20,
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("Contruction Equipment"),
                            ),
                          ]),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(246, 231, 234, 239),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Landscape(),
                        ));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/landscaping.png",
                                width: 100, height: 70),
                            // Icon(
                            //   Icons.settings,
                            //   size: 20,
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text("Landscaping"),
                            ),
                          ]),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(246, 231, 234, 239),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Solar_products(),
                        ));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/solar.png",
                                width: 100, height: 70),
                            // Icon(
                            //   Icons.settings,
                            //   size: 20,
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text("Solar Products"),
                            ),
                          ]),
                    )),
              ),
            ],
          ),
// ------------------------------------------------- Workshop ---------------------------------------------------------------------------------
          Container(
            width: 200,
            height: 150,
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: AssetImage("assets/images/workshop.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // FARMER TOOLS

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(246, 231, 234, 239),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Compressors(),
                        ));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/compressor.png",
                                width: 100, height: 75),
                            // Icon(
                            //   Icons.settings,
                            //   size: 20,
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("Compressors"),
                            ),
                          ]),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(246, 231, 234, 239),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => welding(),
                        ));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/welding.png",
                                width: 100, height: 75),

                            // Icon(
                            //   Icons.settings,
                            //   size: 20,
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("Welding"),
                            ),
                          ]),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(246, 231, 234, 239),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Automative(),
                        ));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/autom.png",
                                width: 100, height: 70),

                            // Icon(
                            //   Icons.settings,
                            //   size: 20,
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("Automative Mantainance"),
                            ),
                          ]),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(246, 231, 234, 239),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Material(),
                        ));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/mathan.png",
                                width: 100, height: 70),
                            // Icon(
                            //   Icons.settings,
                            //   size: 20,
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("Material Handling Tool"),
                            ),
                          ]),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(246, 231, 234, 239),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Cleaning(),
                        ));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/cleaning.png",
                                width: 120, height: 85),
                            // Icon(
                            //   Icons.settings,
                            //   size: 20,
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("Cleaning Tool"),
                            ),
                          ]),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(246, 231, 234, 239),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Big_Workshop(),
                        ));
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("assets/images/bigwork.png",
                                width: 100, height: 70),
                            // Icon(
                            //   Icons.settings,
                            //   size: 20,
                            // ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("Big Wrokshop Tool"),
                            ),
                          ]),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
//================================================================= Bottom NavBAr ======================================================
    );
  }
}
