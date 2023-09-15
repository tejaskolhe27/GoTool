// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:farmer_app/screens/chat/chat.dart';
import 'package:farmer_app/screens/orders/order.dart';
import 'package:flutter/material.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/screens/dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:farmer_app/screens/profile/profile.dart';
import 'package:farmer_app/screens/addproduct/additem.dart';



class MainPage3 extends StatefulWidget {
  const MainPage3({Key? key}) : super(key: key);

  @override
  State<MainPage3> createState() => _MainPage3State();
}

class _MainPage3State extends State<MainPage3> {
  GlobalKey<FormState> key = GlobalKey();

  final user = FirebaseAuth.instance.currentUser!;

  int _page = 3;

  @override
  Widget build(BuildContext context) {
    onPageChanged(int page) {
      setState(() {
        _page = page;
      });
    }

    List<Widget> pages = [
      Dashboard(),
      orders(),
      AddItem(),
      chat(),
      //Tejas()
      Profile(FirebaseAuth.instance.currentUser!.uid),
      

    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xff1e9486),
        unselectedItemColor: Color.fromRGBO(27, 29, 34, 0.8),
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        iconSize: 17,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: GlobalColors.secondaryButtonColor,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(27, 29, 34, 0.6),
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _page == 0 ? Icons.home : Icons.home_outlined,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _page == 1 ? Icons.shopping_bag : Icons.shopping_bag_outlined),
            label: 'PRODUCTS',
          ),
          BottomNavigationBarItem(
            icon: Icon(_page == 2 ? Icons.add_outlined : Icons.add_rounded),
            label: 'ADD',
          ),
          BottomNavigationBarItem(
            icon: Icon(_page == 3 ? Icons.chat : Icons.chat_outlined),
            label: 'CHAT',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _page == 4 ? Icons.account_box : Icons.account_box_outlined),
            label: 'PROFILE',
          ),
        ],
      ),
    );
  }
}
