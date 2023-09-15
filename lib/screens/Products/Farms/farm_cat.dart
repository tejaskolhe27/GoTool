import 'package:flutter/material.dart';

class farm_cat extends StatelessWidget {
  const farm_cat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

      ),
      body: Row(
        children: [
          Container(
            width: 80,
            color: Colors.grey.shade400,
            // child: ,
          )
        ],
      ),
    );
  }
}