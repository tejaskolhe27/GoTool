import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:farmer_app/constants/colors.dart';
import 'package:farmer_app/screens/addproduct/addfarm.dart';
import 'package:farmer_app/screens/addproduct/addoutdoor.dart';
import 'package:farmer_app/screens/addproduct/addworkshop.dart';

import '../../widgets/or_divider.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'ADD ',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: 'PRODUCTS',
                    style: TextStyle(
                      fontSize: 19,
                      color: GlobalColors.primaryButtonColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add the Product to rent as per Categories',
              style: TextStyle(
                fontSize: 13,
                color: GlobalColors.smallText,
                fontWeight: FontWeight.w400,
              ),
            ),
//=========================================================== == ==== ==================== == == == == = == == == = = = == = ==
            const SizedBox(height: 26),

            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              padding: const EdgeInsets.symmetric(vertical: 14),
              color: const Color.fromRGBO(27, 29, 34, 0.4),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const AddFarm()));
                      },
                      child: Image.asset('assets/images/farm.png',
                          width: 150, height: 150),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'FARM',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 13),
            const OrDivider(),
//=========================== = =========================================== == = ======================= = ==========================
            const SizedBox(height: 13),

            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              padding: const EdgeInsets.symmetric(vertical: 14),
              color: const Color.fromRGBO(27, 29, 34, 0.4),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Outdoor()));
                      },
                      child: Image.asset('assets/images/outdoor.png',
                          width: 150, height: 150),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'OUTDOOR',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
//=============================================================================== =================================================
            const SizedBox(height: 13),
            const OrDivider(),
            const SizedBox(height: 13),

            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              padding: const EdgeInsets.symmetric(vertical: 14),
              color: const Color.fromRGBO(27, 29, 34, 0.4),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const AddWorkshop()));
                      },
                      child: Image.asset('assets/images/workshop2.png',
                          width: 150, height: 150),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'WORKSHOP',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
//=============================================================================== ====================================================
          ],
        ),
      ),
    );
  }
}
