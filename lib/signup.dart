import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:farmer_app/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  // @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Signuppage();
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}

final navigatorkey = GlobalKey<NavigatorState>();

class Signuppage extends StatefulWidget {
  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    TextEditingController _emailController = new TextEditingController();
    TextEditingController _passwordController = new TextEditingController();
    TextEditingController _controllerName = TextEditingController();

    void _doSomething() {
           final isValid = formkey.currentState!.validate();
      if (!isValid) return;

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: ((context) => const Center(
                child: CircularProgressIndicator(),
              )));
      try {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .then((value) {
          FirebaseFirestore.instance
              .collection('User')
              .doc(value.user!.uid)
              .set({
            "email": value.user!.email,
            'uid': value.user!.uid,
            'image1': "NO Image ",
            'name': _controllerName.text,
            'phone': "No Phone Number ",
            'DOB': "No DOB",
            'Gender': "No Gender Found",
            'About': "...",
          });
        });

        showDialog(
          context: context,
          builder: (ctx) => Dialog(
            child: Container(
                height: 310,
                child: Column(
                  children: [
                    Lottie.network(
                      "https://assets3.lottiefiles.com/private_files/lf30_3ghvm6sn.json",
                      height: MediaQuery.of(context).size.height * 0.28,
                      fit: BoxFit.cover,
                      repeat: false,
                      animate: true,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => const login()));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: HexColor('#d2e9e6'),
                        ),
                        child: const Text(
                          "Done",
                          style: TextStyle(
                            color: Color(0xff1e9486),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ))
                  ],
                )),
          ),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
      }
      navigatorkey.currentState!.popUntil((route) => route.isFirst);
      // Do something
    }

    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(60.0)),
                  border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/signup.png"))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextField(
                        controller: _controllerName,
                        obscureText: false,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff000000),
                        ),
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22.0),
                            borderSide:
                                const BorderSide(color: Color(0xffffffff), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22.0),
                            borderSide:
                                const BorderSide(color: Color(0xffffffff), width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22.0),
                            borderSide:
                                const BorderSide(color: Color(0xffffffff), width: 1),
                          ),
                          hintText: "Full Name",
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                          filled: true,
                          fillColor: const Color(0xfffefeff),
                          isDense: false,
                          contentPadding: const EdgeInsets.all(8),
                          prefixIcon: const Icon(Icons.person,
                              color: Color(0xff000000), size: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: TextFormField(
                          controller: _emailController,
                          obscureText: false,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                            color: Color(0xff000000),
                          ),
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22.0),
                              borderSide: const BorderSide(
                                  color: Color(0xffffffff), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22.0),
                              borderSide: const BorderSide(
                                  color: Color(0xffffffff), width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22.0),
                              borderSide: const BorderSide(
                                  color: Color(0xffffffff), width: 1),
                            ),
                            hintText: "Email",
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xff000000),
                            ),
                            filled: true,
                            fillColor: const Color(0xffffffff),
                            isDense: false,
                            contentPadding: const EdgeInsets.all(8),
                            prefixIcon: const Icon(Icons.mail,
                                color: Color(0xff000000), size: 24),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter a valid email'
                                  : null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22.0),
                              borderSide: const BorderSide(
                                  color: Color(0xffffffff), width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22.0),
                              borderSide: const BorderSide(
                                  color: Color(0xffffffff), width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22.0),
                              borderSide: const BorderSide(
                                  color: Color(0xffffffff), width: 1),
                            ),
                            hintText: "Password",
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xff000000),
                            ),
                            filled: true,
                            fillColor: const Color(0xffffffff),
                            isDense: false,
                            contentPadding: const EdgeInsets.all(8),
                            prefixIcon: const Icon(Icons.lock,
                                color: Color(0xff000000), size: 24),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (pass1) =>
                              pass1 != null && pass1.length < 6
                                  ? 'Enter min 6 character password'
                                  : null,
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: MaterialButton(
                          onPressed: () {
                            final isValid = formkey.currentState!.validate();
                            if (!isValid) return;

                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: ((context) => const Center(
                                      child: CircularProgressIndicator(),
                                    )));
                            try {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text)
                                  .then((value) {
                                FirebaseFirestore.instance
                                    .collection('User')
                                    .doc(value.user!.uid)
                                    .set({
                                  "email": value.user!.email,
                                  'uid': value.user!.uid,
                                  'image1': "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg",
                                  'name': _controllerName.text,
                                  'phone': "No Phone Number ",
                                  'DOB': "No DOB",
                                  'Gender': "No Gender Found",
                                  'About': "...",
                                });
                              });

                              showDialog(
                                context: context,
                                builder: (ctx) => Dialog(
                                  child: Container(
                                      height: 310,
                                      child: Column(
                                        children: [
                                          Lottie.network(
                                            "https://assets3.lottiefiles.com/private_files/lf30_3ghvm6sn.json",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.28,
                                            fit: BoxFit.cover,
                                            repeat: false,
                                            animate: true,
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    const login()));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                backgroundColor:
                                                    HexColor('#d2e9e6'),
                                              ),
                                              child: const Text(
                                                "Done",
                                                style: TextStyle(
                                                  color: Color(0xff1e9486),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                ),
                                              ))
                                        ],
                                      )),
                                ),
                              );
                            } on FirebaseAuthException catch (e) {
                              print(e);
                            }
                            navigatorkey.currentState!
                                .popUntil((route) => route.isFirst);
                          },
                          color: const Color(0xff1e9486),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0),
                            side:
                                const BorderSide(color: Color(0xff1e9486), width: 1),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          textColor: const Color(0xffffffff),
                          height: 45,
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Already have an account?",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const login()));
                      },
                      child: const Text(
                        "Login",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Color(0xff1e9486),
                        ),
                      ),
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
}
