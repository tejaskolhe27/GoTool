import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/screens/main_page1.dart';
import 'package:flutter/material.dart';

class Outdoord extends StatefulWidget {
  const Outdoord({super.key});

  @override
  State<Outdoord> createState() => _OutdoordState();
}

class _OutdoordState extends State<Outdoord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        
        children: [
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(7.0)),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) =>const MainPage1()));
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: GlobalColors.iconColor,
                  size: 20,
                ),
              ),
            ],
          ),
          RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "      Your ",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: "Farm Tools",
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
            "        I will be delighted to assist you in managing your tool",
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
          Container(
            width: double.infinity,
            height: 270,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/outdoor.jpg"),
                    fit: BoxFit.fill)),
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
                ],),
                    child: TextButton(
                      onPressed: () {
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //   builder: (context) => Construction(),
                        // ));
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
                ],),
                    child: TextButton(
                      onPressed: () {
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //   builder: (context) => Landscape(),
                        // ));
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
                ],),
                    child: TextButton(
                      onPressed: () {
                        // Navigator.of(context).pushReplacement(MaterialPageRoute(
                        //   builder: (context) => Solar_products(),
                        // ));
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
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
